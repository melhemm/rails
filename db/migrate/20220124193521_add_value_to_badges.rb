class AddValueToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :value, :integer, null: true
  end
end
