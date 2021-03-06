#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
# require 'pg'
require 'time'

set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'barbershopar', pool: 2, username: 'user', password: 'qwe'}

# Сущность клиент
class Client < ActiveRecord::Base
	validates :name, presence: {message: 'Поле Имя не должно быть пустым' }
	validates :phone, presence: {message: 'Поле Номер телефона не должно быть пустым' }
	validates :datestamp, presence: {message: 'Поле Дата не должно быть пустым' }
end

class Barber < ActiveRecord::Base
end

class Feedback < ActiveRecord::Base
	validates :message, presence: {message: 'Введите Ваш сообщение' }
end


# ------------------------------------------------------------------------

helpers do
  def username
     session[:identity] ? session[:identity] : 'Login'
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

post '/visit' do
	@specs = Barber.order "name"
	# Сохраняем результаты запроса в переменные
	# @Name = params[:inputName]
	# @Phone = params[:inputPhone]
	# @DateTime = params[:inputDateTime]
	# @Specialist = params[:inputSpecialist]
	# @Colorpicker = params[:colorpicker]
	# c = Client.new :name => @Name, :phone => @Phone, :datestamp => @DateTime, :barber => @Specialist, :color => @Colorpicker
	@c = Client.new params[:client]
	@c.save
	@params = params
	if @c.new_record? 
		@error = @c.errors.messages
		erb  :visit 
	else 
		erb	 "Вы записаны к #{@Specialist} на #{@DateTime} "
	end
end

get '/contacts' do
  erb :contacts
end


post '/contacts' do
	@feedback = params[:feedback]
	@c = Feedback.new :message => @feedback
	@c.save
	if @c.new_record? 
		@error = @c.errors.messages
		erb  :contacts 
	else 
		erb "Спасибо за Ваш отзыв!"
	end
	
end
