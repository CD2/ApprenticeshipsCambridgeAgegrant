class StateDeclaration < ApplicationRecord
  belongs_to :user
  belongs_to :grant_details
  enum declaration: [:yes, :no]
  validates :user_id, :grant_detail_id, presence: true
end
