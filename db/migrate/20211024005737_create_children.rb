class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :middle_name
      t.integer :age
      t.text :status
      t.references :user,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
