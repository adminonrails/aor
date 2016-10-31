class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email

  def to_json(options=nil)
    attributes.slice('id', 'email').to_json
  end
end
