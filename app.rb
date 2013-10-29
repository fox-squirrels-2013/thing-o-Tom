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
  @players = Player.all
  erb :players
  end

get '/view' do

end

get '/destroy' do
  @players = Player.all
  erb :players
  end

post '/destroy' do
  p params
  Player.find(params[:id]).destroy
  @players = Player.all
  erb :players
end

get '/update' do

  @players = Player.all
  erb :players
end

post '/update' do
  p params
  # @name = "#{params[:name]} changed his name to #{params[:newer_name]}!"
  Player.where('name LIKE ?', params[:name]).update_all(position: params[:player_position], number: params[:player_number])
 
  erb :players
end

# <form action="/rename" method="post">
#   <label for="input_name">Which Player:</label><br />
#   <input id="input_name" name="name" type="text" value="" />
#   <br />
#   <label for="input_name">Player Position:</label><br />
#   <input id="input_name" name="player_position" type="text" value="" />
#   <br />
#   <label for="input_name">Player Number:</label><br />
#   <input id="input_name" name="player_number" type="text" value="" />
#   <br />
#   <input type="submit" value="input_name" />
# </form>  
