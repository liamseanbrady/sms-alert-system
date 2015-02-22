class Task < ActiveRecord::Base
  belongs_to :recipient, class_name: 'User', foreign_key: 'used_id'

  validates :phone_number, presence: true
  validates :phrase, presence: true
  validates :recipient, presence: true
end
