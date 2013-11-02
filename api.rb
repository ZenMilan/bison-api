require 'mongo'
require 'json'
require 'grape'

module MongoHelpers
  def object_id val
    BSON::ObjectId.from_string(val)
  end

  def document_by_id id
    id = object_id(id) if String === id
    db.collection("campaigns").find_one(_id: id)
  end

  def db
    @db ||= Mongo::Connection.new.db("bison_db", pool_size: 5, timeout: 5)
  end
end

module Bison
  class API < Grape::API
    version 'v1', using: :path
    format :json

    do_not_route_head!
    do_not_route_options!

    helpers MongoHelpers

    namespace :campaigns do
      desc "Return a list of all campaigns"

      get do
        db.collection('campaigns').find.to_a
      end

      desc "Return single campaign"

      get '/:id' do
        document_by_id(params[:id])
      end

      desc "Create new campaign"

      post do
        data = JSON.parse env['api.request.body']
        oid = db.collection("campaigns").insert(data)
        { id: oid.to_s }
      end

      desc "Destroy a campaign by id"

      delete '/:id' do
        db.collection("campaigns").remove(_id: object_id(params[:id]))
        { success: true }
      end

      namespace :location do
        desc "Return all campaigns of a certain location"

        get '/:location' do
          db.collection("campaigns").find(location: params[:location]).to_a
        end
      end
    end
  end
end

puts Bison::API::routes