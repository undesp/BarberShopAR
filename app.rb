#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pg'

set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'barbershopar', pool: 2, username: 'user', password: 'qwe'}

# Сущность клиент
class Client < ActiveRecord::Base

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end