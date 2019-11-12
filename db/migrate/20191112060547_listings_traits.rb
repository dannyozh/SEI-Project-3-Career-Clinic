class ListingsTraits < ActiveRecord::Migration[5.2]
  def change
    create_table :listings_traits do |t|
      t.references :listing
      t.references :trait
      t.timestamps
    end
  end
end
