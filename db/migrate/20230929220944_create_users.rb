class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :indentificationNumber
      t.date :startDate
      t.date :endDate
      t.string :name
      t.string :email
      t.string :mainNumber
      t.string :optNumber, default: "" , null: false
      t.references :person_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
