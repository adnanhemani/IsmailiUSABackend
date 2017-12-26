class ChangeEvents < ActiveRecord::Migration
  def change
    remove_column :events, :registration
    add_column :events, :details, :text
  end
end
