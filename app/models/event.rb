class Event < ApplicationRecord
  mount_uploader :image, EventUploader
end
