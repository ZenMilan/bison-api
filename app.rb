# require 'rubygems'
require 'sinatra/base'
# require 'mongo'
# require 'json'

class BisonAPI < Sinatra::Base

  get '/' do
    "Hello Pruett!"
  end

end