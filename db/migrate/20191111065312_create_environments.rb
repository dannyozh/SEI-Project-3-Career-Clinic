class CreateEnvironments < ActiveRecord::Migration[5.2]
  def change
    create_table :environments do |t|
      t.text :work_space
      t.text :hours
      t.text :team_size
      t.timestamps
    end
  end
end
