class TagsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.new( tag_params )
    if @tag.save
      redirect_to @tag
    else
      render 'new'
    end
  end
  
  def show
    @tag = Tag.find( params[:id] )
  end
  
  def index
    @tags = Tag.all
  end
  
  def destroy
    @tag = Tag.find( params[:id] )
    @tag.destroy
    redirect_to tags_path
  end
  
  private
    def tag_params
      params.require(:tag).permit( :name )
    end
  
end
