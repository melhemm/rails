class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img_url, null: false
      t.string :reward_rule, null: true
      
      t.timestamps
    end
  end
end
