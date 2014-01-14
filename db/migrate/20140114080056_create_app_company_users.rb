class CreateAppCompanyUsers < ActiveRecord::Migration
  def change
    create_table :app_company_users do |t|
      t.integer :app_id
      t.integer :company_user_id
      t.string :role

      t.timestamps
    end
  end
end
