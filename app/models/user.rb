class User < ActiveRecord::Base
  include Sluggable

  has_secure_password validations: false
 
  has_many :tasks
  
  scope :branches, -> { where role: 'branch' }

  sluggable_column :username

  validates :role, presence: true
  validates :username, presence: true, uniqueness: true
  validates :phone_number, length: { is: 12 }, format: { with: /\A44*/, message: 'must start with 44' }, :if => :branch?
  validates :password, length: { minimum: 8 }, on: :create

  def branch?
    role == 'branch'
  end

  def admin?
    role == 'admin'
  end

  def uncompleted_tasks
    tasks.where(completed_at: nil)
  end
end
