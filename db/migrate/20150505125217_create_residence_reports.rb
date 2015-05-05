class CreateResidenceReports < ActiveRecord::Migration
  def change
    create_table :residence_reports do |t|
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :country_code, limit: 2
      t.integer :unit, limit: 2
      t.integer :construction_year, limit: 4
      t.date :report_date
      t.float :energy_performance
      t.string :energy_class, limit: 1
      t.float :thermal_insulation
      t.string :thermal_class, limit: 1

      t.timestamps null: false
    end
  end
end
