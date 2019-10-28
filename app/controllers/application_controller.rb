require 'sinatra'
require 'action_mailer'
require_relative 'mailer'

get '/notify' do
  Mailer.notify(params).deliver_now #if params["MICRO_KEY"] == ENV["MICRO_KEY"]
end
