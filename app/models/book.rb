class Book < ApplicationRecord
    has_many :comment_books
    has_many :commentis, as: :commentable
end
