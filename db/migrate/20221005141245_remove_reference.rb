class RemoveReference < ActiveRecord::Migration[6.1]
  def change
    remove_reference :links, :usesr
  end
end
