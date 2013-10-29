require 'sinatra'
require 'active_record'
require_relative './models/player'
require_relative './db/seeds/seeds'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'sinatra_skeleton_dev')

get '/' do
  erb :index
end

get '/players' do
  @players = Player.all
  erb :players
end

post '/players' do
  # puts params
  p params[:player_name]
  Player.create(name: params[:player_name])
  erb :players
  end

get '/view' do

end
