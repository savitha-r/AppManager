class RenameTypeInVersions < ActiveRecord::Migration
  def change
  	rename_column :versions, :type, :device_type
  end
end
