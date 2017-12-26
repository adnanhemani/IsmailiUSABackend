class AddEventRefToAnnouncements < ActiveRecord::Migration
  def change
    add_reference :announcements, :event, foreign_key: true
  end
end
