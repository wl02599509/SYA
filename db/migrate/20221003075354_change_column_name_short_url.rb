class ChangeColumnNameShortUrl < ActiveRecord::Migration[6.1]
  def up
    rename_column :links, :short_url, :shortened_url
  end
end
