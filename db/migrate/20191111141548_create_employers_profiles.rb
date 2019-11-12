class CreateEmployersProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :employers_profiles do |t|
      t.string :company_name
      t.string :company_logo
      t.references :employer
      t.timestamps
    end
  end
end
