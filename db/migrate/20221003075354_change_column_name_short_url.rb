class ChangeColumnNameShortUrl < ActiveRecord::Migration[6.1]
  def change
    rename_column :links, :short_url, :shortened_url
  end
end
