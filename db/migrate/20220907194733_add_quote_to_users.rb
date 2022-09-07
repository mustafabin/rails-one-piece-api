class AddQuoteToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :quote, :string
  end
end
