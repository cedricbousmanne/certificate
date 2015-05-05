class AddCompanyIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :company_id, :integer
    add_index :clients, :company_id
  end
end
