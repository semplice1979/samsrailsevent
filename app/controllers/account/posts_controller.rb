class Account::PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = current_user.posts.order("id DESC")
  end

  def show 
  	@posts = current_user.posts
  end
  

end

