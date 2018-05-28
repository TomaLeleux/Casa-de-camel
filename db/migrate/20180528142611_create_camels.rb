class CreateCamels < ActiveRecord::Migration[5.2]
  def change
    create_table :camels do |t|
      t.string :name
      t.string :localisation
      t.integer :number_of_place
      t.string :food_type
      t.string :color
      t.references :user, foreign_key: true
      t.boolean :wifi
      t.integer :chameaux_fiscaux
      t.integer :vitesse_max

      t.timestamps
    end
  end
end
