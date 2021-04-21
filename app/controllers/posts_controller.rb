class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  #метод для создания нового поста posts/new
  def new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    #render plain: params[:post].inspect для проверки вывода информации из формы [:post] - назвние формы
    @post = Post.new(post_params)
    @post.save

    redirect_to @post # вызовет метод show и переведет пользователя на новую страницу
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end


end
