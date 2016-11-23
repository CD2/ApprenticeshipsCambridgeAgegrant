class GrantReview < ApplicationRecord

  attr_accessor :files
  # validates :files, presence: true

  attr_accessor :learners_consent

  validates_acceptance_of :learners_consent


  belongs_to :grant_detail
  has_many :documents, autosave: true, dependent: :destroy
  accepts_nested_attributes_for :documents, allow_destroy: true, reject_if: :all_blank

  delegate :apprentice_start_date, :training_provider,  :apprentice_start_date=, :training_provider=, to: :grant_detail

  def new_files= files
    (files || []).each do |file|
      next unless file
      documents.build(document: file)
    end
  end

end
