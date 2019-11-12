class IndustriesListings < ActiveRecord::Migration[5.2]
  def change
    create_table :industries_listings do |t|
      t.references :listing
      t.references :trait
      t.timestamps
    end
  end
end
