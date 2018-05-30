class RenameColumnLocalisationByCountry < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :camels, :localisation, :country
  end
end
