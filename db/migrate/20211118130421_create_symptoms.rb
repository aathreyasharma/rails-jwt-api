class CreateSymptoms < ActiveRecord::Migration[6.1]
  def change
    create_table :symptoms do |t|
      t.integer :test_id
      t.string :name
      t.float :infection_rate
      t.timestamps
    end
  end
end
