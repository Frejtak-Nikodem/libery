class AddStatusToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :user_id, :integer
    add_column :books, :status, :boolean, default: false
  end
end
