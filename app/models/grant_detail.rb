class GrantDetail < ApplicationRecord

default_scope -> { order(id: :asc) }

  attr_accessor :terms_conditions
  attr_accessor :share_info_checkbox
  attr_accessor :email

  validates :title, :work_number, :forename, :employment_sector, :surname, :postcode, :town_name, :company_name, :address_line_one, :learner_name, :learner_dob, :apprentice_start_date, :bank_name, :account_number, :sort_code, presence: true

  validates :share_info_checkbox, :terms_conditions, :acceptance => true

  validate :no_more_old_grants, if: :new_record?

  has_one :grant_review, dependent: :destroy
  belongs_to :user

  scope :young, -> {where('DATE(apprentice_start_date) - DATE(learner_dob) < ?', 6940)}
  scope :old, -> {where('DATE(apprentice_start_date) - DATE(learner_dob) >= ?', 6940)}


  # scope :old, -> {where("to_date(learner_dob, 'DD/MM/YYYY') < ?", 19.years.ago)}


  belongs_to :training_provider

  after_create :send_confirmation_email
  after_create :notify_training_provider

  def no_more_old_grants
    begin
       Date.parse(learner_dob)
      if apprentice_start_date.to_datetime - learner_dob.to_datetime < 19.years
        remaining = if $norfolk_site
          345 - GrantDetail.old_count
        else
          120 - GrantDetail.old_count
        end
        errors.add(:learner_dob, 'is invalid. All age grants for 18-24 year olds have gone.') if remaining < 1
      end
    rescue ArgumentError
      errors.add(:learner_dob, 'is an invalid date format.')
    end
  end

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
  enum trade_supplier_type_select: ['Company', 'Partnership', 'Sole Trader', 'Trust', 'Other'], _prefix: 'trade_'

  def less_than_18
    learner_dob.to_datetime > 19.years.ago
  end

  def self.young_count
    x = 0
    all.each do |g|
      begin
        x += 1 if ((g.apprentice_start_date.to_datetime - g.learner_dob.to_datetime) < 19.years)
      rescue
      end
    end
    return x
    #GrantDetail.young.count
  end

  def self.old_count
    all.count - GrantDetail.young_count
  end


  def review_submitted
    grant_review.documents.any?
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
    val = '-1' if val.blank?
    super TrainingProvider.find(val) unless val.to_i == -1
  end

  def email
    if self.user.present?
      user.email
    else
      @email
    end
  end

  def grant_review
    super || create_grant_review
  end

  def approve!
    update(approved: true)
    send_approval_email
  end

  def notify_training_provider
    if training_provider&.email.present?
      AdminMailer.notify_training_provider(self).deliver_now
    end
  end

  def trade_supplier_type_select
    @trade_supplier_type_select ||= begin
      if ['Company', 'Partnership', 'Sole Trader', 'Trust'].include? self.trade_supplier_type
        self.trade_supplier_type
      else
        'Other'
      end
    end
  end

  def trade_supplier_type_select= val
    @trade_supplier_type_select = val
  end

  before_save do
    if trade_supplier_type_select!='Other'
      self.trade_supplier_type=trade_supplier_type_select
    end
  end

  private

    def send_confirmation_email
      UserMailer.confirmation_email(self).deliver_now
    end

    def send_approval_email
      AdminMailer.approve_application(self).deliver_now
    end



end
