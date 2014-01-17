class AddAppIdtoVersions < ActiveRecord::Migration
  def change
  	add_column :versions, :app_id, :integer
  end
end
