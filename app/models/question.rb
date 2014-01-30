class Question < ActiveRecord::Base
  # Associations
  belongs_to :section

  # Validations
  validates :title, presence: true, length: {within: 1..160}
  validates :answer, length: {maximum: 1600}

  validates :section, presence: true

  # Instance methods
  def answered?
    !self.answer.nil? && !self.answer.strip.empty?
  end

end
