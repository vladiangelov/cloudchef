class AddAddressToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :address, :string
  end
end
