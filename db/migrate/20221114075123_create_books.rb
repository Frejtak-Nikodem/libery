class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :title
      t.text :species
      t.text :author
      t.date :release_date

      t.timestamps
    end
  end
end
