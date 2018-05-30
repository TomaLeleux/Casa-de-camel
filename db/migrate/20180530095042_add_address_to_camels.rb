class AddAddressToCamels < ActiveRecord::Migration[5.2]
  def change
    add_column :camels, :address, :string
  end
end
