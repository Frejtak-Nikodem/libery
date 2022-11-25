class Book < ApplicationRecord
    has_one_attached :image
    belongs_to :author
    belongs_to :user, optional: true
    has_many :comments

    validates :title,  presence: true
    validates :species, presence: true
end
