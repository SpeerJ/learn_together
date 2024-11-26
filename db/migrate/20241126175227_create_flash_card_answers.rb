class CreateFlashCardAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :flash_card_answers do |t|
      t.references :flash_card, null: false, foreign_key: true
      t.string :value
      t.text :explanation
      t.boolean :correct, default: true

      t.timestamps
    end
  end
end
