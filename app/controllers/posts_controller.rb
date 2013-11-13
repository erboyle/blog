class PostsController < ApplicationController
  before_filter :authenticate_user!
    
  def new
    @post = Post.new
  end
  
  def create
    @post.user = current_user
    @post = Post.new( post_params )
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def edit
    @post = Post.find( params[:id] )
  end
  
  def update
    @post = Post.find( params[:id] )
    if @post.update_attributes( post_params )
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def tag
    @tag = Tag.find( params[:tag_id] )
    @posts = @tag.posts
  end
  
  def show
    @post = Post.find( params[:id] )
    @tags = Tag.all
  end
  
  def add_tag
    @post = Post.find( params[:id] )
    @tag = Tag.find( params[:tag_id] )
    Tagging.create( { post_id: @post.id, tag_id: @tag.id } )
    redirect_to @post
  end
  
  def delete_tag
    @post = Post.find( params[:id] )
    @tag = Tag.find( params[:tag_id] )
    tagging = @post.taggings.find_by_tag_id( @tag.id )
    tagging.destroy
    redirect_to @post
  end

  def index
    @posts = Post.order( 'created_at DESC' ).limit( 5 )
    @tags = Tag.all
  end
  
  def archives
    @posts = Post.all.order( 'created_at DESC' )
  end
  
  def destroy
    @post = Post.find( params[:id] )
    @post.destroy
    redirect_to posts_path
  end
  
  private
    def post_params
      params.require(:post).permit( :title, :text )
    end
  
end
