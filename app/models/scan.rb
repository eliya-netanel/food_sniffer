class Scan < ApplicationRecord
  belongs_to :user
  belongs_to :food_item
  # validates :result ,optional: true #, presence: true,, inclusion: { in: [ "true", "false", "nil"] }
end
