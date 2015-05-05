class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :fullname
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :country_code

      t.timestamps null: false
    end
  end
end
