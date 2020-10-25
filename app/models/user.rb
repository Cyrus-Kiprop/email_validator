class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates_presence_of(:first_name, :last_name, :url, :email)

  validates_length_of :email, maximum: 255

  validates :email, uniqueness: true
end
