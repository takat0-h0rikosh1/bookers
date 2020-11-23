class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 20 }
  validates :body, presence: true, length: { maximum: 200 }

  belongs_to :user
end
