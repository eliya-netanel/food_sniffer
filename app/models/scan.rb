class Scan < ApplicationRecord
  belongs_to :user
  belongs_to :food_item, optional: true

end
 # validates :result ,optional: true #, presence: true,, inclusion: { in: [ "true", "false", "nil"] }
