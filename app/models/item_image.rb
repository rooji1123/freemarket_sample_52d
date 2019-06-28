class ItemImage < ApplicationRecord
  belongs_to :item
  mount_uploader :images, ImageUploaderUploader
end
