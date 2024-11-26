class CreateTopics < ActiveRecord::Migration[8.0]
  def change
    create_table :topics do |t|
      t.string :name
      t.string :description
      t.text :explanation
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
