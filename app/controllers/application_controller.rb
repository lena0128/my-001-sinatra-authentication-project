class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "carcollection"
    end
    
    helpers do

        def logged_in?
            !!current_user # double negation pattern
        end

        def current_user
            @current_user ||= User.find_by(:email => session[:email]) if session[:email]
        end

        def login(email, password)
            # Check if a user with this email actually exists
            # If so, set the session

            # If I can't find the user, the line user = User.find_by(:email => email) will return nil
            user = User.find_by(:email => email) 

            if user && user.authenticate(password) 
                session[:email] = user.email 
            # otherwise, redirect to '/error'
            # Is the user who they claim to be
            else
                redirect to '/login'
            end
        end

        def logout!
            session.clear
            # Emailing them to let them know they logged out 
        end
    end

end