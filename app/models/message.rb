class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :body, presence: true, if: -> { image.blank? }
  validates :image, presence: true, if: -> { body.blank? }
  mount_uploader :image, ImageUploader
  validates :group_id, presence: true
  validates :user_id, presence: true
end
