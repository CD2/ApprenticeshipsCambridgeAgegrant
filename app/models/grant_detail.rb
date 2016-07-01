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
      'Mr',
      'Mrs',
      'Ms',
      'Dr'
    ]
  end

  attr_accessor :terms_conditions

  has_secure_password
  validates :password, presence: true, length: {minimum:5}, allow_nil: true

  validates_presence_of 
    :title,
    :forename,
    :surname,
    :email,
    :work_number,
    :postcode,
    :town_name
    :company_name,
    :address_line_one,
    :address_line_two,
    :learner_name,
    :learner_dob,
    :apprentice_start_date,
    :bank_name,
    :account_number,
    :sort_code


  validates :forename, :surname, format: {with: /\A[-a-z]+\z/}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with:  VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}

  validates :share_info_checkbox, :terms_conditions, :acceptance => true

end
