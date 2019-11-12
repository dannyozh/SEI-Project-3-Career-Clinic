class EnvironmentsListings < ActiveRecord::Migration[5.2]
  def change
    create_table :environments_listings do |t|
      t.references :listing
      t.references :environment
      t.timestamps
    end
  end
end
