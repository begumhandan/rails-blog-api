class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.includes(:user, :category, :comments, :tags).all
    render json: @posts, include: { 
      user: { only: [:id, :name] }, 
      category: {}, 
      comments: { include: :user },
      tags: {}
    }, status: :ok
  end

  def show
    render json: @post, include: { 
      user: { only: [:id, :name] }, 
      category: {}, 
      comments: { include: :user },
      tags: {}
    }, status: :ok
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Post not found' }, status: :not_found
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :category_id, tag_ids: [])
  end
end
