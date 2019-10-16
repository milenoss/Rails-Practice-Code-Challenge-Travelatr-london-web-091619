class PostsController < ApplicationController 


def index 

    @post = Post.all 

end

def new 
@post = Post.new

end

def show 
@post = Post.find(params[:id])

end

def create 

@post = Post.create(post_params)

if @post.valid? 
    redirect_to post_path(@post)
else 
    render :new

end
end


def edit 

@post = Post.find(params[:id])
end

def update

@post = Post.update(post_params(:name, :title, :content))
redirect_to post_path(@post)
end


def destroy 
@post = Post.find(params[:id])
@post.destroy

redirect_to posts_path

end

private 

def post_params 
    params.require(:post).permit!

end

end



