class Post < ApplicationRecord
    validates :tittle, presence: true, length: { minimum: 5, maximum: 50 }
    validates :body, presence: true
    belongs_to :user
    #after_destroy {notify admi of bad behavior}
    has_many :comments, dependent: :destroy

    has_rich_text :body
    has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy
end
