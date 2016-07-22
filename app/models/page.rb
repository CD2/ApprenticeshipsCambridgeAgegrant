class Page < ApplicationRecord

  default_scope -> {order order: :asc}

  extend FriendlyId
  friendly_id :url_alias

  scope :norfolk, -> {where(norfolk: true)}
  scope :peterborough, -> {where(peterborough: true)}
  scope :cambridge, -> {where(cambridge: true)}

  before_save :set_url

  def set_url
    self.url_alias = self.name.parameterize
  end

end
