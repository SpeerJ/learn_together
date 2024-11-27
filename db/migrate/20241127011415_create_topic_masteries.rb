class CreateTopicMasteries < ActiveRecord::Migration[8.0]
  def change
    create_table :topic_masteries do |t|
      t.references :topic, null: false, foreign_key: true
      t.date :last_studied
      t.references :user, null: false, foreign_key: true
      t.decimal :mastery_score

      t.timestamps
    end
  end
end
