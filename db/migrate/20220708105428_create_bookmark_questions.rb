class CreateBookmarkQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmark_questions, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.references :question, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :bookmark_questions, [:user_id, :question_id], unique: true
  end
end
