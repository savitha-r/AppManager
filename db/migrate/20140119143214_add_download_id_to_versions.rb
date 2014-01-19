class AddDownloadIdToVersions < ActiveRecord::Migration
  def change
  	add_column :versions, :download_id, :string
  end
end
