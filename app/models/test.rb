class Test < ApplicationRecord
  belongs_to :category
  def self.sort_categories(category)
    Test.joins("JOIN categories ON tests.category_id = categories.id").where(categories: {title: category}).order(title: :desc)
  end
end