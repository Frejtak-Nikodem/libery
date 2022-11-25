class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.text :rate
      t.text :name
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
