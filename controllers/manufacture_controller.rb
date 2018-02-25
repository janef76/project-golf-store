require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative( '../models/manufacturer.rb' )

get '/manufacturers/index' do
  @manufacturers = Manufacturer.all()
  erb( :"manufacturers/index" )
end

get '/manufacturers/new' do
  erb(:"manufacturers/new")
end

post '/manufacturers' do
  manufacturer = Manufacturer.new(params)
  manufacturer.save
  redirect to(:"/manufacturers/index")
end
