require 'rack/cors'
require './api'

use Rack::Cors do
  allow do
    origins '*'
  end
end

run Bison::API