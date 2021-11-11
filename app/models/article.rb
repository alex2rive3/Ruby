class Article < ApplicationRecord
    belongs_to :user
    has_rich_text :content
	has_many :commentis, as: :commentable
    has_many :comments
    has_many :has_categories
    has_many :categories, through: :has_categories #(through significa a través de.)
    attr_accessor :category_elements
	def save_categories
    	#categy_elements 1,2,3
    	#concertir eso en un arreglo 1,2,3 => [1,2,3]
    	#categories_array = category_elements.split(",") #esto no hace falta al tener el checkbox
    	# iterar ese arreglo
    	return has_categories.destroy_all if category_elements.nil? || category_elements.empty?

    	has_categories.where.not(category_id: category_elements).destroy_all
    	category_elements.each do |category_id|
    		# crear HasCategory HasCategory<article_id: 1, category_id: 2>
				HasCategory.find_or_create_by(article: self,category_id: category_id)
		end
	end
end
