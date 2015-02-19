class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :role, presence: true
  validates :username, presence: true
  validates :phone_number, presence: true, :if => :branch?
  validates :password, presence: true, length: { minimum: 8 }, on: :create

  def branch?
    role == 'branch'
  end
end
