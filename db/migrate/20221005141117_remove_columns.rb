class RemoveColumns < ActiveRecord::Migration[6.1]
  def change
    remove_columns :links, :user_id
  end
end
