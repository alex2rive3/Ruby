class User < ApplicationRecord
  has_many :articles
  has_one_attached :avatar
  has_many :comments
  has_many :photos
  has_many :comment_photos
  has_many :comment_books
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
