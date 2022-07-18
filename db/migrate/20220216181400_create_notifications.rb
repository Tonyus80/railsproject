class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.text :content_notification

      t.timestamps
    end
  end
end
