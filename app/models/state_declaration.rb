class StateDeclaration < ApplicationRecord
  belongs_to :user
  enum declaration: [:yes, :no]
end
