class AddColumnNameToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :content_notification, :text
    add_column :notifications, :seen, :boolean

  end
end
