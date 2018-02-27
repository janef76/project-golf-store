require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative( '../models/type.rb' )

get '/types/index' do
  @types = Type.all()
  erb(:"types/index")
end

get '/types/new' do
  erb(:"types/new")
end

post '/types' do
  type = Type.new(params)
  type.save()
  redirect to(:"types/index")
end

get '/types/:id' do
  @types = Type.find(params[:id])
  erb(:"/types/edit")
end

get '/types/:id/edit' do
  @types = Type.find(params[:id])
  erb(:"types/edit")
end

post '/types/:id/delete' do
  type = Type.find(params[:id])
  type.delete()
  redirect to (:"/types/index")
end

post '/types/:id/edit' do
  type = Type.new(params)
  type.update()
  redirect to (:"/types/index")
end
