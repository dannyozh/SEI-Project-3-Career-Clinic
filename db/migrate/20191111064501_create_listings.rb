class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :job_title
      t.references :employer_profile
      t.string :photo_url
      t.text :duration
      t.text :location
      t.text :description
      t.references :trait
      t.references :environment
      t.timestamps
    end
  end
end
