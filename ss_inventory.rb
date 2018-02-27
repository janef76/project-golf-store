require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('controllers/club_controller')
require_relative('controllers/manufacture_controller')
require_relative('controllers/type_controller')

get '/' do
  erb(:index)
end
