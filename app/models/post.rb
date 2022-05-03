class Post < ApplicationRecord
    validates :tittle, presence: true, length: { minimum: 5, maximum: 50 }
    validates :body, presence: true

    has_rich_text :body
    belongs_to :category

    belongs_to :user
    has_many :comments, dependent: :destroy

    has_rich_text :body
    has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy
end
