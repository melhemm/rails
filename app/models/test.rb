class Test < ApplicationRecord
  belongs_to :category
  has_many :users
  has_many :questions
  has_many :user_tests
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  
  def self.sort_categories(category)
    joins(:category)
     .where(categories: {title: category})
     .order(title: :desc)
     .pluck(:title)
  end
end