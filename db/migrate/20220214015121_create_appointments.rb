class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
       t.datetime :date
       t.text :comment
       t.string :visited
       t.references :user, null: false, foreign_key: true
       t.references :patient, null: false, foreign_key: true
       t.timestamps
    end
  end
end
