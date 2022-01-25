class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :tests_as_auther, class_name: "Test", foreign_key: "author_id", dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  validates :email, uniqueness: true, format: {with: /[a-zA-Z0-9_\-\.]{0,}([.]?[a-zA-Z0-9]{1,})[@](gmail.com|hotmail.com|yahoo.com|yandex.com|yandex.ru|mail.ru)/}
  
  def tests_in_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def completed_tests
    tests.where('test_passages.passed = ?', true)
  end

  def admin?
    type == "Admin"
  end

end
