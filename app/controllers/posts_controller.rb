class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :about]

  def index
    @posts = Post.all.order("created_at DESC")
  end


  def new
    @post = current_user.posts.build 
  end


  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render "new"
    end
  end


  def show 
    
  end


  def edit

  end


  def update  
    if @post.update(post_params)
      redirect_to post_path(@post)  
    else
      render "edit"
    end  
  end

  def destroy
    @post.destroy
    flash[:alert] = "delete success"
    redirect_to posts_path
  end

  def about
     @users = User.all
     @posts = Post.all
     @comments = Comment.all
  end
 



  private

    def find_post
      @post = Post.find(params[:id])
    end


    def post_params
      params.require(:post).permit( :title, :content, :clicked, :category_ids => [])
    end














end
