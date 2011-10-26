class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :race
      t.string :gender
      t.integer :age
      t.integer :height

      t.timestamps
    end
  end
end
