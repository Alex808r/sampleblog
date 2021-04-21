class PagesController < ApplicationController
  def about
    @heading = "Про нас"
    @text = "Немного текста"
  end

  def contacts
    @heading = "Контакты"
    @text = "Наши контакты"
  end

end
