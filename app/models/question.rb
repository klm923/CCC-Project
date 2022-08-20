class Question < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :claim
end
