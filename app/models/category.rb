class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :posts, dependent: :destroy
    has_many :post
    has_many :category, through: :post
end
