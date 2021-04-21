class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  #строчка нужна для авторизации без devise
  #http_basic_authenticate_with name: 'admin', password: '123', except: [:index, :show]

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

    if @post.update(post_params)
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
      render 'new' # перезагрузка страницы если не прошла валидация можно написать render action: 'new'
      # если в методе "create" мы бы не написали render "new", то нам бы вернулось представление "create.html.erb",
      # но у нас нет такого представления и поэтому мы просто возвращаем action "new" который подтянет представление
      # "new.html.erb"
      #
      # Использовать "redirect_to" в данном случае нельзя, потому, что тогда потеряется переменная "@post" из метода
      # "create" так как "redirect_to" происходит на стороне браузера, а не на стороне сервера.
      # Когда делаем render "new" переменная не теряется.
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path

    # "render" не прерывает запрос текущий, а продолжает его дальше, а "redirect_to" прерывает и отравляет браузер на
    # другую страницу. То есть "redirect_to" делает два запроса: прерывает операцию и отправляет браузер
    # на другую страницу, и переменная теряется, а "render" происходит в рамках текущего запроса,
    # не прерывая его,  поэтому сохраняется переменная.
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
