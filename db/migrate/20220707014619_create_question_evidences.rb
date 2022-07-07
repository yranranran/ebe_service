class CreateQuestionEvidences < ActiveRecord::Migration[7.0]
  def change
    create_table :question_evidences, id: :uuid do |t|
      t.references :question, null: false, foreign_key: true, type: :uuid
      t.references :evidence, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
