class AddColumnUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :links, :user_id, :integer
  end
end
