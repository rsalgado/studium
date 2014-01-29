class Reading < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :title, presence: true, length: { within: 1..160 }
  validates :user, presence: true
end
