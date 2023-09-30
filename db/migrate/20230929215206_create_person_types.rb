class CreatePersonTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :person_types do |t|
      t.string :letter

      t.timestamps
    end
  end
end
