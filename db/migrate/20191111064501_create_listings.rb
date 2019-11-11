class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :employer
      t.references :trait
      t.references :environment
      t.timestamps
    end
  end
end
