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
