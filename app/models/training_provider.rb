class TrainingProvider < ApplicationRecord

  default_scope { order('name asc') }

  has_many :grant_details

end
