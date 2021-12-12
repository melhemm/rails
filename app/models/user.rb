require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :tests_as_auther, class_name: "Test", foreign_key: "author_id"

  validates :email, uniqueness: true, format: {with: /[a-zA-Z0-9_\-\.]{0,}([.]?[a-zA-Z0-9]{1,})[@](gmail.com|hotmail.com|yahoo.com|yandex.com|yandex.ru|mail.ru)/}
  
  has_secure_password

  def tests_in_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end