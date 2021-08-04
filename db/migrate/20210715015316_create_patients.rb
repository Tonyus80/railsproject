class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :name_surname
      t.string :gender
      t.integer :age
      t.string :address
      t.string :pps
      t.string :medical_card
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
