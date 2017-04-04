class Painting < ApplicationRecord
  belongs_to :gallery

  mount_uploader :painting, PaintingUploader
end
