class CreateLikeAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :like_answers, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.references :answer, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :like_answers, [:user_id, :answer_id], unique: true
  end
end
