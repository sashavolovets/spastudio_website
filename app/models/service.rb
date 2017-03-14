class Service < ApplicationRecord
  has_attached_file :image,
  :path => ":rails_root/public/system/service_:attachment/:id/:basename_:style.:extension",
  :url => "/system/service_:attachment/:id/:basename_:style.:extension",
  default_url: ->(attachment) {ActionController::Base.helpers.asset_path("assets/default_:style_avatar.jpg")},
  :styles => {
    :small => ['240x125#', :jpg],
    :big => ['480x250#', :jpg],
    :hd => ['2400x1250#', :png]
  }

  validates_attachment :image, content_type: { content_type: /^image\/(jpeg|png|gif|tiff)$/ },
                       :size => { in: 0..12.megabytes }

  belongs_to :category
  has_many :price_tags
end
