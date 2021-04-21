class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid? # в контроллере post представлена эквивалентная запись, но короче и удобнее
     @contact.save
    redirect_to @contact
    else
      render 'new'
         # если в методе "create" мы бы не написали "render action new",
         # то нам бы вернулось представление "create.html.erb",
         # но у нас нет такого представления и поэтому мы просто возвращаем
         # action "new" который подтянет представление "new.html.erb"
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :message)
  end

end
