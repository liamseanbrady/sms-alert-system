class User < ActiveRecord::Base
  include Sluggable

  has_secure_password validations: false
 
  has_many :tasks
  
  scope :branches, -> { where role: 'branch' }

  sluggable_column :username

  validates :role, presence: true
  validates :username, presence: true, uniqueness: true
  validates :phone_number, presence: true, :if => :branch?
  validates :password, length: { minimum: 8 }, on: :create

  def branch?
    role == 'branch'
  end

  def admin?
    role == 'admin'
  end
end
