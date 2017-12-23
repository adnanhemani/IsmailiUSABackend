class AddJamatkhanaToAUser < ActiveRecord::Migration
  def change
    add_reference :announcement_users, :jamatkhana, index: true, foreign_key: true
  end
end
