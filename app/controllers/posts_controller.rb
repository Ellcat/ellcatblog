class PostsController < ApplicationController
  

 def new 
  @post = Post.new
end

def index
  @posts = Post.all
end

def create
@post = Post.new(params[:post].permit(:title, :body, :author))

  if @post.save
    redirect_to @post
  else
    render 'new'
  end
end

def show
  @post = Post.find(params[:id])
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])

  if @post.update(params[:post].permit(:title, :body))
    redirect_to @post
  else 
    render 'edit'
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy

  redirect_to posts_path
end

def post_body( post ) 
  Post.new(post.body).to_html.html_safe
end



private
 def post_params
  params.require(:post).permit(:title, :body, :author)
 end

end
