class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :categories_by_name, -> (category) { joins(:category).where(categories: {title: category}) }

  validates :time_limit, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  
  def self.sort_categories(category)
    categories_by_name(category)
    .order(title: :desc)
    .pluck(:title)
  end

  def self.by_category(name)
    categories_by_name(name).order(title: :desc).pluck(:title)
  end
end
