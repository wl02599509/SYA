class AddNewColumnShortUrl < ActiveRecord::Migration[6.1]
  def change
    add_column :links, :short_url, :string
  end
end
