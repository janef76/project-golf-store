require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/club.rb')
require_relative('../models/manufacturer.rb')

get '/clubs/index' do
  @clubs = Club.all()
  erb( :"clubs/index" )
end

get '/clubs/new' do
  @manufacturers = Manufacturer.all()
  erb(:"clubs/new")
end

post '/clubs' do
  club = Club.new(params)
  club.save()
  redirect to(:"clubs/index")
end

get '/clubs/:id' do
  @clubs = Club.find(params[:id])
  @manufacturers = Manufacturer.all()
  erb(:"clubs/show")
end

get '/clubs/:id/edit' do
  @clubs = Club.find(params[:id])
  erb(:"/clubs/edit")
end

post '/clubs/:id/delete' do
  club = Club.find(params[:id])
  club.delete()
  redirect to (:"/clubs/index")
end

post '/clubs/:id/edit' do
  club = Club.new(params)
  club.update()
  redirect to (:"/clubs/index")
end
