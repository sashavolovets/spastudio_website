class Category < ApplicationRecord
  has_attached_file :image,
  :path => ":rails_root/public/system/category_:attachment/:id/:basename_:style.:extension",
  :url => "/system/category_:attachment/:id/:basename_:style.:extension",
  default_url: ->(attachment) {ActionController::Base.helpers.asset_path("assets/default_:style_image.jpg")},
  :styles => {
    :small => ['240x125+125+0#', :jpg],
    :big => ['480x250+125+0#', :jpg],
    :hd => ['2400x1250+125+0#', :png]
  }

  validates_attachment :image, content_type: { content_type: /^image\/(jpeg|png|gif|tiff)$/ },
                       :size => { in: 0..20.megabytes }

  has_many :services
end
