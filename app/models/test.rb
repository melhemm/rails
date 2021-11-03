class Test < ApplicationRecord

  def self.sort_categories(category_title)
    Test.includes(:category).where(categories: { title: category_title }).order(title: :desc)
  end

end
