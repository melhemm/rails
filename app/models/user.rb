class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests
  has_many :tests_as_auther, class_name: "Test", foreign_key: "author_id"

  validates :email, presence: true
  
  def tests_in_level(level)
    tests.where(level: level)
  end
end