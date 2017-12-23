class CreateJamatkhanas < ActiveRecord::Migration
  def change
    create_table :jamatkhanas do |t|
      t.text :region
      t.text :name
      t.text :address
      t.text :phonenumber

      t.timestamps null: false
    end
  end
end
