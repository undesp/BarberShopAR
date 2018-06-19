#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pg'

set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'barbershopar', pool: 2, username: 'user', password: 'qwe'}

# Сущность клиент
class Client < ActiveRecord::Base
end
class Barber < ActiveRecord::Base
end

# ------------------------------------------------------------------------

helpers do
  def username

     session[:identity] ? session[:identity] : 'Гость'
  end
end

get '/' do
	@barbers = Barber.order "name"
	erb :index
end

get '/visit' do
	@specs = Barber.order "name"
erb :visit
end