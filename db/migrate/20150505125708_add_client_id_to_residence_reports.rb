class AddClientIdToResidenceReports < ActiveRecord::Migration
  def change
    add_column :residence_reports, :client_id, :integer
    add_index :residence_reports, :client_id
  end
end
