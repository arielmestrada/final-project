class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_breed

  def index
    @post = Post.new
    @posts = @breed.posts.order(created_at: :desc)
    render 'posts/index'
  end

  def create
    respond_to do |format|
      @post = Post.create(post_params)
      format.html { redirect_to breed_posts_path(params[:breed_id]), success: 'Post created successfully!' }
    end
  end

  private

  def get_breed
    @breed = Breed.find(params[:breed_id])
  end

  def post_params
    params.require(:post).permit(:body, :user_id, :breed_id)
  end

end
