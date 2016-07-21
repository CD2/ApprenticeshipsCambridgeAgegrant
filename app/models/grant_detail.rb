class GrantDetail < ApplicationRecord


  scope :young, -> {where('learner_dob > ?', 18.years.ago)}
  scope :old, -> {where('learner_dob < ?', 18.years.ago)}

  def self.training_providers
    [
      'training prov 1',
      'training prov 2',
      'training prov 3',
      'My Training provider is not listed'
    ]
  end

  def self.titles
    [
      "Mr", "Mrs", "Miss", "Ms", "Dr", "Prof", "Sir", "Dame", "Lord", "Lady"
    ]
  end

  def self.employment_sector
    [
      "Advanced manufacturing and engineering",
      "Building growth",
      "Culture",
      "Energy",
      "Food, drink and agriculture",
      "Financial Services",
      "ICT and Digital Creative",
      "Ports and logistics",
      "Tourism",
      "Life sciences",
      "Health and social care",
      "Hospitality",
      "Retail",
      "Agritech"
    ]
  end

  enum title: titles
  enum training_provider: training_providers
  enum employment_sector: employment_sector

  def less_than_18
    learner_dob.to_datetime > 18.years.ago
  end


  attr_accessor :terms_conditions
  attr_accessor :share_info_checkbox
  attr_accessor :email

  validates :title, :work_number, :forename, :employment_sector, :surname, :postcode, :town_name, :company_name, :address_line_one, :address_line_two, :learner_name, :learner_dob, :apprentice_start_date, :bank_name, :account_number, :sort_code, presence: true

  validates :share_info_checkbox, :terms_conditions, :acceptance => true

  has_one :grant_review
  belongs_to :user

  after_create :training_provider_not_listed_email

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


  def invoice_number
    "AGE#{id.to_s.rjust(4, padstr='0')}"
  end

  private

  def training_provider_not_listed_email
    if training_provider == 'My Training provider is not listed'
      AdminMailer.no_training_provider(self).deliver_now
    end
  end

end
