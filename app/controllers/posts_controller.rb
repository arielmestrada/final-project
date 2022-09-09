class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_breed

  def index
    @users = User.all
    @user = current_user.id
    
    @post = Post.new
    @posts = @breed.posts.order(created_at: :desc)

    @comment = Comment.new
    render 'posts/index'
  end

  def create
    @comment = Comment.new
    respond_to do |format|
      @post = Post.create(post_params)
      format.html { redirect_to breed_posts_path(params[:breed_id]), success: 'Post created successfully!' }
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(body: params[:post][:body])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def get_breed
    @breed = Breed.find(params[:breed_id])
  end

  def post_params
    params.require(:post).permit(:body, :user_id, :breed_id)
  end

end
