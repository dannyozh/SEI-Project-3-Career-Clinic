class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.string :company_name
      t.text :contact
      t.string :industry
      t.text :duration
      t.text :location
      t.text :description
      t.timestamps
    end
  end
end
