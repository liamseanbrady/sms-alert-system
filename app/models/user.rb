class User < ActiveRecord::Base
  validates :role, presence: true, :if => :branch?
  validates :username, presence: true
  validates :phone_number, presence: true

  def branch?
    role == 'branch'
  end
end
