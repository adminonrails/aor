class CreateAdmUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :adm_users do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
