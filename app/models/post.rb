class Post < ApplicationRecord
    validates :tittle, presence: true, length: { minimum: 5, maximum: 50 }
    validates :body, presence: true, length: { minimum: 5, maximum: 50 }
    belongs_to :user
    after_destroy {notify admi of bad behavior}
    has_many :comments, dependent: :destroy
end
