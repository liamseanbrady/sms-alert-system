class Phrase < ActiveRecord::Base
  validates :body, presence: true
end
