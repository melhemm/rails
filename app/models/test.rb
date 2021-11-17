class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests

  scope :easy_level, -> { where(level: 0..1)}
  scope :medium_level, -> { where(level: 2..4)}
  scope :hard_level, -> { where(level: 5..Float::INFINITY)}
  scope :categories_by_name, -> (category) { joins(:category).where(categories: {title: category}) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0}, allow_nil: true
  validates :validate_max_level, on: :create
  
  def self.sort_categories(category)
    categories_by_name(category)
    .order(title: :desc)
    .pluck(:title)
  end

  def validate_max_level
    errors.add(:level) if level.to_i > 10
  end
  
end