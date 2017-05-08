class Favorite < ApplicationRecord
  belongs_to :account

  enum status: { active: 0, suspended: 1 }
end
