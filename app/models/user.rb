class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  
  def tests_in_level(level)
    tests.where(level: level)
    # .joins('INNER JOIN user_tests ON test_id = tests.id')
    # .where(user_tests: {user_id: id})
  end
end