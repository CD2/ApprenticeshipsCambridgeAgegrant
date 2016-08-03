class GrantReview < ApplicationRecord

  attr_accessor :files
  # validates :files, presence: true

  attr_accessor :learners_consent


  belongs_to :grant_detail
  has_many :documents, autosave: true, dependent: :destroy
  accepts_nested_attributes_for :documents, allow_destroy: true, reject_if: :all_blank

  def new_files= files
    (files || []).each do |file|
      next unless file
      documents.build(document: file)
    end
  end

end
