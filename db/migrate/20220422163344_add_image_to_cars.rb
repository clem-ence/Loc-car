class AddImageToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :car_image, :string
  end
end
