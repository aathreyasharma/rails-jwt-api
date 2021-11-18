class AddInfectionToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :infected, :boolean, default: false
  end
end
