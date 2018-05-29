class AddPricePerDayToCamels < ActiveRecord::Migration[5.2]
  def change
    add_column :camels, :price_per_day, :integer
  end
end
