class Post < ApplicationRecord
  has_many :comments, :dependent => :destroy # для удаления статьи с комметнарием дописываем :dependent => :destro
  validates :title, presence: true, length: { minimum: 5}


end
