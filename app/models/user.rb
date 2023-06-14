class User < ApplicationRecord
  has_secure_password

  has_one_attached :avatar do |attachment|
    attachment.variant :thumb, resize_to_limit: [200,200]
    attachment.variant :profile, resize_to_limit: [800,800]
  end

  validates :password, confirmation: true
end
