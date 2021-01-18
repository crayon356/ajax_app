class PostsController < ApplicationController
  before_action :basic_auth

def index
  @posts = Post.all.order(id: "DESC")
end

#def new
#end

def create
  Post.create(content: params[:content], checked: false)
  render json:{ post: post }
end

def checked
  post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end
    item = Post.find(params[:id])
    render json: { post: item }
end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
  end
  end
end