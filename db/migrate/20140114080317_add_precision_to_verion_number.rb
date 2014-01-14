class AddPrecisionToVerionNumber < ActiveRecord::Migration
  def change
  	change_column :versions, :number, :decimal, :precision => 4, :scale => 2
  end
end
