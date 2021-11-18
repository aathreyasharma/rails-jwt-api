class AddAttributesToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :travel_history, :boolean, default: false
    add_column :tests, :contact_with_covid_patient, :boolean, default: false
  end
end
