require 'sinatra/base'
require 'json'

class BisonAPI < Sinatra::Base

  get '/' do
    content_type :json
    { :key1 => 'value1', :key2 => 'value2' }.to_json
  end

end