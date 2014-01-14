class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.decimal :number
      t.string :type
      t.integer :no_of_downloads
      t.string :download_type

      t.timestamps
    end
  end
end
