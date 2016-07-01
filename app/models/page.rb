class Page < ApplicationRecord

  extend FriendlyId
  friendly_id :url_alias
  
end
