class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.text :location
      t.datetime :start
      t.datetime :end
      t.text :registration

      t.timestamps null: false
    end
  end
end
