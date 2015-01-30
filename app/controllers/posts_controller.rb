class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all.order('created_at DESC')

    respond_to do |format|
        format.html
        format.xml { render xml: @posts }
        format.atom
    end

  end

  def show 
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new 
    5.times { @post.assets.build }
  end

  def edit
    @post = Post.find(params[:id])
    5.times { @post.assets.build }
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id   
    params.permit!
    if @post.save
      redirect_to :action => :index
    else 
      render 'new'
    end 
  end

  def update
    @post = Post.find(params[:id])
    params.permit!
    respond_to do |format|

    if  @post.update_attributes(params[:post])
      flash[:notice] = 'Post was successfully updated.'
      format.html { redirect_to(@post) }
    else
      format.html { render :action => "edit" }
      format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
    end
    end
  end

  def destroy
    @post.destroy 
    redirect_to :action => :index
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:model, :price, :brand, :number_of_km, :car_capacity, :description, :user_id, :user_id, :assets)
    end
end
