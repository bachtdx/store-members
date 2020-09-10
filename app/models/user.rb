class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :email, :password_digest
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
                with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }

  def self.search(keyword)
    users = all
    users = users.where("name like ? or email like ?", "%#{keyword}%", "%#{keyword}%")
    users
  end
end
