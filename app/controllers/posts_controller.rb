class PostsController < ApplicationController
  #before_filter :authenticate, except: [:index, :show ]
  #before_action :set_post, only: [:show, :edit, :update, :destroy]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @posts }
      format.atom
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post } 
    end
  end

  
  #private
    # Use callbacks to share common setup or constraints between actions.
    #def set_post
     # @post = Post.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def post_params
     # params.require(:post).permit(:title, :body)
    #end

    #def authenticate
     # authenticate_or_request_with_http_basic do |name, password|
      #  name == "admin" && password == "secret"
      #end
    #end
end
