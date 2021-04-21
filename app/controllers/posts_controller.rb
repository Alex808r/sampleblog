class PostsController < ApplicationController
  #строчка нужна для авторизации
  http_basic_authenticate_with name: 'admin', password: '123', except: [:index, :show]

  def index
    @posts = Post.all
  end

  #метод для создания нового поста posts/new
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

# метод для редактирования
  def edit
    @post = Post.find(params[:id])
  end

  #метод для обновления
  def update
    @post = Post.find(params[:id])

    if(@post.update(post_params))
      redirect_to @post # вызовет метод show и переведет пользователя на новую страницу
    else
      render 'edit' # перезагрузка страницы если не прошла валидация
    end
  end

  def create
    #render plain: params[:post].inspect для проверки вывода информации из формы [:post] - назвние формы
    @post = Post.new(post_params)

    if(@post.save)
      redirect_to @post # вызовет метод show и переведет пользователя на новую страницу
    else
      render 'new' # перезагрузка страницы если не прошла валидация
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end


end
