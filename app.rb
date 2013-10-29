require 'sinatra'
require 'active_record'
require_relative './models/player'
require_relative './db/seeds/seeds'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'sinatra_skeleton_dev')

get '/' do
  "Hello World!"
end
