class Painting < ApplicationRecord
  belongs_to :gallary

  mount_uploader :painting, PaintingUploader
end
