class CreatePincode < ActiveRecord::Migration[6.1]
  def change
    create_table :pincodes do |t|
      t.string :code
      t.integer :infection_count
      t.timestamps
    end
  end
end
