class Like < ApplicationRecord
  belongs_to :claim
  belongs_to :user

  validates_uniqueness_of :claim_id, scope: :user_id

end
