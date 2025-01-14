class CreateFlashCards < ActiveRecord::Migration[8.0]
  def change
    create_table :flash_cards do |t|
      t.string :name
      t.string :description
      t.references :topic, null: false, foreign_key: true
      t.decimal :difficulty, precision: 2, scale: 1
      t.string :type, null: false, default: "HiddenAnswerFlashCard"

      t.timestamps
    end
  end
end
