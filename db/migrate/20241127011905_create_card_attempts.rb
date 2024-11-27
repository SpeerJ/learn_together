class CreateCardAttempts < ActiveRecord::Migration[8.0]
  def change
    create_table :card_attempts do |t|
      t.decimal :score
      t.references :flash_card, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
