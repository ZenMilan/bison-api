require 'sinatra/base'
require 'sinatra/json'
require 'mongo'
require 'json'

class BisonAPI < Sinatra::Base
  helpers Sinatra::JSON

  configure do
    set :DB, Mongo::Connection.new.db("bison_db", :pool_size => 5, :timeout => 5)
    set :collection_name, "campaigns"
  end

  helpers do
    def object_id val
      BSON::ObjectId.from_string(val)
    end

    def document_by_id id
      id = object_id(id) if String === id
      settings.DB.collection(settings.collection_name).find_one(:_id => id)
    end
  end

  get '/api/campaigns/?' do
    json settings.DB.collection(settings.collection_name).find.to_a
  end

  get '/api/campaigns/:id/?' do
    json document_by_id(params[:id])
  end

  get '/api/campaigns/location/:location' do
    json settings.DB.collection(settings.collection_name).find(:location => params[:location]).to_a
  end

  post '/api/campaigns' do
    data = JSON.parse(request.body.read)
    oid = settings.DB.collection(settings.collection_name).insert(data)
    json id: oid.to_s
  end
end