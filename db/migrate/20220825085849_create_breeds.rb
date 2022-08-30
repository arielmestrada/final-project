class CreateBreeds < ActiveRecord::Migration[7.0]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :bred_for
      t.string :breed_group
      t.string :facts
      t.text :temperament, default: [], array: true
      t.string :image_url
      t.timestamps
    end
    add_index :breeds, :name, unique: true
  end
end
