class Badge < ApplicationRecord
  has_many :users, through: :user_badges
  has_many :user_badges, dependent: :destroy

  BADGE_RULES = {
    'Passing all tests in a category' => :all_in_category,
    'Passing the test successfully on the first try' => :first_attempt,
    'Passing all tests of a certain level' => :level_choice
  }.freeze
end
