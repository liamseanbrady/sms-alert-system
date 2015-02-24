class Task < ActiveRecord::Base
  belongs_to :recipient, class_name: 'User', foreign_key: 'user_id'

  validates :phone_number, presence: true
  validates :phrase, presence: true
  validates :recipient, presence: true

  def self.to_csv
    CSV.generate do |csv|
      csv << (column_names + ['branch_name'])
      all.each do |task|
        csv << (task.attributes.values_at(*column_names) + [task.recipient.username]) 
      end
    end
  end
end
