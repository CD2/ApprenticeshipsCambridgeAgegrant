class Document < ApplicationRecord
  mount_uploader :document, FileUploader
end
