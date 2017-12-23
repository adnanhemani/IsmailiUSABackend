class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :title
      t.text :body
      t.boolean :is_event

      t.timestamps null: false
    end
  end
end
