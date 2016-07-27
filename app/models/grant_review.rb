class GrantReview < ApplicationRecord

  attr_accessor :files
  validates :files, presence: true

  belongs_to :grant_detail
  has_many :documents

end
