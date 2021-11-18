class AddAttributesToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :mobile, :integer
    add_column :users, :pincode_id, :integer
  end
end
