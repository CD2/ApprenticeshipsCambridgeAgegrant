class GrantDetail < ApplicationRecord

  scope :young, -> {where('learner_dob > ?', 18.years.ago)}
  scope :old, -> {where('learner_dob < ?', 18.years.ago)}

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

  enum title: titles
  enum training_provider: training_providers

  def less_than_18
    learner_dob.to_datetime > 18.years.ago
  end


  attr_accessor :terms_conditions
  attr_accessor :share_info_checkbox
  attr_accessor :email

  validates :title, :work_number, :forename, :surname, :postcode, :town_name, :company_name, :address_line_one, :address_line_two, :learner_name, :learner_dob, :apprentice_start_date, :bank_name, :account_number, :sort_code, presence: true

  validates :share_info_checkbox, :terms_conditions, :acceptance => true

  has_one :grant_review
  belongs_to :user

  def review_submitted
    grant_review.present?
  end

  require 'csv'
  def self.to_csv
    columns = GrantDetail.columns.map(&:name) - ['id', 'updated_at', 'user_id']
    columns += ['review_submitted']
    CSV.generate(headers: true) do |csv|
      csv << [''] + columns.map(&:titleize)

      all.each_with_index do |grant_detail, i|
        csv << [i+1] + columns.map{ |attr| grant_detail.send(attr) }
      end
    end

  end

end
