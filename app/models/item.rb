class Item < ApplicationRecord
	
  has_one_attached :item_image
  belongs_to :gen

  def get_item_image
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      item_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    item_image.variant(resize_to_limit: [300, 300]).processed
  end

  def tax
  	tax = 1.1
  	tax_fee = (tax * price)
		return tax_fee.to_i
  end


end
