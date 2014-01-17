class AddCompanyIdtoApps < ActiveRecord::Migration
  def change
  	add_column :apps, :company_id, :integer
  end
end
