require 'sinatra'
require 'active_record'
require_relative './app/models/elephant'

ActiveRecord::Base.establish_connection(adapter: 'postgresql')

get '/' do
  "Hello World!"
end
