class PostsController < ApplicationController
  before_action :login_required, :only => [:new, :create, :edit,:update,:destroy]
def new
  @group = Group.find(params[:group_id])
  @post = @group.posts.build
end
def create
  #@group = Group.find(params[:group_id])
  #@post = @group.posts.new(post_params)
  @post = @group.posts.new(post_params)
  @post.author = current_user

  if @post.save
  redirect_to group_path(@group)
else
  render :new
end
end
def edit
  #@group = Group.find(params[:group_id])
  #@post = @group.posts.find(params[:id])
  @post = current_user.posts.find(params[:id])
end
def update
  @group = Group.find(params[:group_id])
  @post = @group.posts.find(params[:id])

if @post.update(post_params)
  redirect_to group_path(@group)
else
  render :edit
end
end

def destroy
  #@group = Group.find(params[:group_id])
  #@post = @group.posts.find(params[:id])
  @post = current_user.posts.find(params[:id])
  @post.destroy
  @post.destroy
  redirect_to group_path(@group), :alert => 'Deleted'
end


private

def post_params
params.require(:post).permit(:content)
end

end
