class ChangeClickedAttribude < ActiveRecord::Migration[6.1]
  def up
    change_column :links, :clicked, :integer
  end
end
