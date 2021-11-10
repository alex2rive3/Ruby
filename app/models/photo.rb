class Photo < ApplicationRecord
    belongs_to :user
    enum license: [:copyright, :copyleft, :creative_comons]
    enum visibility:[:pub, :priv]
    has_many :comment_photos
end
