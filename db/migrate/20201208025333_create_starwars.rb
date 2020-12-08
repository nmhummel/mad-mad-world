class CreateStarwars < ActiveRecord::Migration
  def change
    create_table :starwars do |t|
      t.string :adjective_1
      t.string :adjective_2
      t.string :adjective_3
      t.string :adjective_4
      t.string :animal_1
      t.string :character_1
      t.string :character_2
      t.string :character_3
      t.string :name_1
      t.string :name_2
      t.string :noun_1
      t.string :noun_2
      t.string :noun_3
      t.string :noun_4
      t.string :number_1
      t.string :planet_1
      t.string :quote_1
      t.string :specie_1
      t.string :specie_2
      t.string :specie_3
      t.string :vehicle_1
      t.string :vehicle_2
      t.string :vehicle_3
      t.string :verb_1
      t.string :verb_3
      t.string :verb_3
      t.string :verb_4
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
