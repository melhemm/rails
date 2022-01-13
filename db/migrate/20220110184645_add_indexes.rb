class AddIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :answers, :body
    add_index :questions, :body
    add_index :tests, %i[title level], unique: true
    add_index :users, %i[first_name last_name]
  end
end
