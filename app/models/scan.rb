class Scan < ApplicationRecord
  belongs_to :user
  belongs_to :food_item

end
 # validates :result ,optional: true #, presence: true,, inclusion: { in: [ "true", "false", "nil"] }
