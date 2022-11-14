class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :last_name
      t.text :biography
      t.text :country_of_birth

      t.timestamps
    end
  end
end
