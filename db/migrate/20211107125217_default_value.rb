class DefaultValue < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :level, default: true
    add_column :answers, :correct, default: true
  end
end
