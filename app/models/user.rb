class User < ApplicationRecord
  has_secure_password

  has_one_attached :avatar do |attachment|
    attachment.variant :thumb, resize_to_limit: [200,200]
    attachment.variant :profile, resize_to_limit: [500,500]
  end

  validates :username, :email, :firstname, :lastname, :phonenumber, presence: true
  validates :password, presence: true, confirmation: true

  validate :validate_image

  private

  def validate_image
    if avatar.attached?
      if !avatar.blob.content_type.in?(%w[image/jpeg image/png])
        errors.add(:avatar, "Add Only JPEG or PNG files")
      end
    end
  end
end
