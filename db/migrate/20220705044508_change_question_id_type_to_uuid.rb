class ChangeQuestionIdTypeToUuid < ActiveRecord::Migration[7.0]
  def up
    add_column :questions, :uuid, :uuid, null: false, default: 'gen_random_uuid()'
    add_column :answers, :question_uuid, :uuid

    execute <<~SQL
      UPDATE answers SET question_uuid = questions.uuid
      FROM questions WHERE answers.question_id = questions.id;
    SQL

    remove_foreign_key :answers, :questions
    remove_reference :answers, :question, index: true

    change_table :questions do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    execute 'ALTER TABLE questions ADD PRIMARY KEY (id);'

    rename_column :answers, :question_uuid, :question_id
    
    add_foreign_key :answers, :questions
    add_index :answers, :question_id
    change_column_null :answers, :question_id, false
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
