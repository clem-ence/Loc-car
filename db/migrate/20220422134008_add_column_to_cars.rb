class AddColumnToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :name, :string
    add_column :cars, :description, :string
    add_column :cars, :price_per_day, :integer
    add_column :cars, :user_id, :bigint
  end
end
