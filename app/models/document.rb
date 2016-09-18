class Document < ApplicationRecord
  mount_uploader :document, FileUploader
  belongs_to :grant_review

  before_create do
    unless grant_review.documents.any?
      AdminMailer.grant_review_uploaded(grant_review.grant_detail).deliver_now
    end
  end

end
