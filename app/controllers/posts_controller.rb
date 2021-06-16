class PostsController < ApplicationController

    get '/posts' do
        "A list of publically available posts"
    end

    get '/posts/new' do
        # Checking if they are logged in
        if !logged_in?
            redirect to '/login'  # Redirecting if they aren't 
        else
            "A new post form"
        end
    end


        get '/posts/:id/edit' do
            if !logged_in?
                redirect to '/login'  # Redirecting if they aren't 
            else
                # how do I find the post that only the author user is allowed to edit? 
                post = Post.find(params[:id])
                if post.user_id == current_user.id
                # better way for this line: if post = current_user.posts.find_by(params[:id]), which means if I can find the post which belongs to this user, I will...
                "An edit post form #{current_user.id} is editing #{post.id}"
                else
                    redirect to '/posts'
                end
            end
        end
end