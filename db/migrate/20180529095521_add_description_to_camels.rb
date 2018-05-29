class AddDescriptionToCamels < ActiveRecord::Migration[5.2]
  def change
    add_column :camels, :description, :text
  end
end
