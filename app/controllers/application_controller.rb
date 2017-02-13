require './config/environment'
require './app/models/item'
require './app/models/giphy'
require './app/models/message'
require 'httparty'
require 'json'
require 'twilio-ruby'


class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @items = Item.all
    erb :index
  end

  post '/new' do
    new_gif_message = Item.create(message: params[:message], gif_search: params[:gif_search])

    m = Message.new(params[:message], "+12242340123")

    g = Giphy.mms_search(params[:gif_search])


    new_gif_message.gif_url = g
    new_gif_message.save
    
    m.mms_send(new_gif_message.gif_url)
    redirect to '/'
  end

end
