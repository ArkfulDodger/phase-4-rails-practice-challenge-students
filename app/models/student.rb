class Student < ApplicationRecord
  belongs_to :instructor

  validates :name, presence: true
  validate :is_at_least_18

  def is_at_least_18
    errors.add(:age, 'must be at least 18 years old') unless age >= 18
  end
end
