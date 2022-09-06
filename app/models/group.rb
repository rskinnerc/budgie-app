class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :operations

  validates :name, :icon, presence: true

  def total
    operations.sum(:amount)
  end
end
