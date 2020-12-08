class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :adjective
      t.string :location
      t.string :noun
      t.string :number
      t.string :person
      t.string :quote
      t.string :title
      t.string :verb
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
