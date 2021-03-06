class Reading < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :sections, dependent: :destroy

  # Validations
  validates :title, presence: true, length: { within: 1..160 }
  validates :user, presence: true
end
