class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :family_name
      t.string :first_name
      t.string :family_name_kana
      t.string :first_name_kana
      t.boolean :status, null: false,default: 'true'
      t.string :email
      t.string :postal_code
      t.string :address
      t.string :phone_number
      t.string :password
      t.string :profile_image

      t.timestamps
    end
  end
end
