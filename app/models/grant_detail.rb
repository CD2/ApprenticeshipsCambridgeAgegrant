class GrantDetail < ApplicationRecord

  attr_accessor :terms_conditions
  attr_accessor :share_info_checkbox
  attr_accessor :email

  validates :title, :work_number, :forename, :employment_sector, :surname, :postcode, :town_name, :company_name, :address_line_one, :learner_name, :learner_dob, :apprentice_start_date, :bank_name, :account_number, :sort_code, presence: true

  validates :share_info_checkbox, :terms_conditions, :acceptance => true

  has_one :grant_review
  belongs_to :user

  after_create :training_provider_not_listed_email

  scope :young, -> {where('learner_dob >= ?', 18.years.ago)}
  scope :old, -> {where('learner_dob < ?', 18.years.ago)}

  belongs_to :training_provider

  def full_address
   [self.company_name, self.address_line_one, self.address_line_two, self.address_line_three, self.town_name, self.county, self.postcode].reject(&:blank?).join(',')
  end

  def self.titles
    ["Mr", "Mrs", "Miss", "Ms", "Dr", "Prof", "Sir", "Dame", "Lord", "Lady"]
  end

  def self.employment_sector
    [
      "Construction",
      "Culture",
      "Energy",
      "Engineering",
      "Food, drink and agriculture",
      "Financial Services",
      "ICT and Digital Creative",
      "Ports and logistics",
      "Tourism",
      "Life sciences",
      "Health and social care",
      "Hospitality",
      "Retail",
      "Agritech",
      "Other"
    ]
  end

  enum title: titles
  enum employment_sector: employment_sector

  def less_than_18
    learner_dob.to_datetime > 18.years.ago
  end

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

  def training_provider= val
    super TrainingProvider.find(val) unless val.to_i == -1
  end

  private

  def training_provider_not_listed_email
    AdminMailer.no_training_provider(self).deliver_now if training_provider.nil?
  end

end
