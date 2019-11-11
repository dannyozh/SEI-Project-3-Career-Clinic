class CreateExplorersProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :explorers_profiles do |t|
      t.string :name
      t.integer :age
      t.string :photo_url
      t.references :explorer
      t.timestamps
    end
  end
end
