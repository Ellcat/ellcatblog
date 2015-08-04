class PostsController < ApplicationController
 # before_filter :except => [ :create, :index, :show, :edit, :update, :destroy ]

  # before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
     @post = Post.find(params[:id])
  end

  
  def create
    @post = Post.new(post_params)
  end

 
  def update
    @place = Place.find(params[:id])
  @place.update_attributes(post_params)

  end

  
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
  
end


