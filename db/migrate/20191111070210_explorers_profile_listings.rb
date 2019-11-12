class ExplorersProfileListings < ActiveRecord::Migration[5.2]
  def change
    create_table :explorers_profile_listings do |t|
      t.references :explorer_profile
      t.references :listing
      t.boolean :connect, default: false
      t.timestamps
    end
  end
end