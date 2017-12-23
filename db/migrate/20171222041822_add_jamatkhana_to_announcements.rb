class AddJamatkhanaToAnnouncements < ActiveRecord::Migration
  def change
    add_reference :announcements, :jamatkhana, index: true, foreign_key: true
  end
end
