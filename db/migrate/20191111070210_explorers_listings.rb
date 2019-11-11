class ExplorersListings < ActiveRecord::Migration[5.2]
  def change
    create_table :explorers_listings do |t|
      t.references :explorer
      t.references :listing
      t.timestamps
    end
  end
end
