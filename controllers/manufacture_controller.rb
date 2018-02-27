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

get '/manufacturers/:id' do
  @manufacturers = Manufacturer.find( params[:id] )
  erb(:"/manufacturers/edit")
end

get '/manufacturers/:id/edit' do
  @manufacturers = Manufacturer.find( params[:id] )
  erb(:"/manufacturers/edit")
end

post '/manufacturers/:id/delete' do
  manufacturer = Manufacturer.find( params[:id] )
  manufacturer.delete()
  redirect to (:"/manufacturers/index")
end

post '/manufacturers/:id/edit' do
  manufacturer = Manufacturer.new( params)
  manufacturer.update()
  redirect to (:"/manufacturers/index")
end
