class CreateDevilFruits < ActiveRecord::Migration[7.0]
  def change
    create_table :devil_fruits do |t|
      t.string :name
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
