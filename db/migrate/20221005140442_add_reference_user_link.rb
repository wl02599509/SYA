class AddReferenceUserLink < ActiveRecord::Migration[6.1]
  def change
    remove_columns :links, :users, :integer
    add_reference :links, :usesr
  end
end
