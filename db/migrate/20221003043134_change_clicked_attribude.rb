class ChangeClickedAttribude < ActiveRecord::Migration[6.1]
  def change
    change_column :links, :clicked, :integer
  end
end
