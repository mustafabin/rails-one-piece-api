class CreateDevilFruits < ActiveRecord::Migration[7.0]
  def change
    create_table :devil_fruits do |t|
      t.string :name
      t.string :user_id
      t.string :df_type
      t.timestamps
    end
  end
end
