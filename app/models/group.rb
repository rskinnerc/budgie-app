class Group < ApplicationRecord
  belongs_to :user
  has_many :operations

  validates :name, :icon, presence: true

  def total
    # TODO: Implement total for all transactions in this category
    0.00
  end
end
