class DefaultValue < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :level, default: true, null: false
    add_column :answers, :correct, default: true, null: false
  end
end
