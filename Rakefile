ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'

# We need this line of code to be loaded into memory when you want to try the rake tasks 
require 'sinatra/activerecord/rake'

task :console do
    Pry.start
end