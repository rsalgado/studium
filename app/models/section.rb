class Section < ActiveRecord::Base
  # Associations
  belongs_to :reading

  # Validations
  validates :notes, length: {maximum: 12000}
  validates :name, presence: true, length: {within: 1..160}
  
  validates :reading, presence: true
end
