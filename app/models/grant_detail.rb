class GrantDetail < ApplicationRecord

  def self.training_providers
    [
      'training prov 1',
      'training prov 2',
      'training prov 3',
    ]
  end

  def self.titles
    [
      "Mr", "Mrs", "Miss", "Ms", "Dr", "Prof", "Sir", "Dame", "Lord", "Lady"
    ]
  end


  attr_accessor :terms_conditions
  attr_accessor :share_info_checkbox

  validates :title, :forename, :surname, :email, :work_number, :postcode, :town_name, :company_name, :address_line_one, :address_line_two, :learner_name, :learner_dob, :apprentice_start_date, :bank_name, :account_number, :sort_code, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with:  VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}

  validates :share_info_checkbox, :terms_conditions, :acceptance => true

  has_one :grant_review
  belongs_to :user

end
