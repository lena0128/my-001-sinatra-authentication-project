class SessionsController < ApplicationController

get '/login' do

erb :"sessions/login.html"
end

post '/sessions' do
    # login a user with this email
    login(params[:email], params[:password])
    redirect to '/posts'
end

# Building a logout
get '/logout' do
    logout!
    redirect to '/login'
end

end
