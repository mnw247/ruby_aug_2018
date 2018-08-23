class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :songs, :count, :total
    rename_column :playlists, :count, :total
  end
end
