class Item < ApplicationRecord
	
  has_one_attached :item_image

  def get_item_image
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end

end
