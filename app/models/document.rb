class Document < ApplicationRecord
  mount_uploader :document, FileUploader
  belongs_to :grant_review

end
