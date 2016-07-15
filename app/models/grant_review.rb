class GrantReview < ApplicationRecord

  mount_uploader :file, FileUploader

  belongs_to :grant_detail

end
