class ChangeChannelsColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :channels, :group?, :boolean, default: false
    add_column :channels, :group, :boolean, default: true
  end
end
