require 'rack/cors'
require './api'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :delete]
  end
end

run Bison::API