class User < ApplicationRecord
  def tests_in_level(level)
    Test.where(level: level).joins('INNER JOIN user_tests ON test_id = tests.id').where(user_tests: {user_id: id})
  end
end