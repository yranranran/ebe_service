class ChangeUserIdTypeToUuid < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :uuid, :uuid, null: false, default: 'gen_random_uuid()'
    add_column :questions, :user_uuid, :uuid
    add_column :answers, :user_uuid, :uuid

    execute <<~SQL
        UPDATE questions SET user_uuid = users.uuid
        FROM users WHERE questions.user_id = users.id;
    SQL

    execute <<~SQL
      UPDATE answers SET user_uuid = users.uuid
      FROM users WHERE answers.user_id = users.id;
    SQL

    remove_foreign_key :questions, :users
    remove_reference :questions, :user, index: true

    remove_foreign_key :answers, :users
    remove_reference :answers, :user, index: true

    change_table :users do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    execute 'ALTER TABLE users ADD PRIMARY KEY (id);'

    rename_column :questions, :user_uuid, :user_id
    rename_column :answers, :user_uuid, :user_id

    add_foreign_key :questions, :users
    add_index :questions, :user_id
    change_column_null :questions, :user_id, false
    
    add_foreign_key :answers, :users
    add_index :answers, :user_id
    change_column_null :answers, :user_id, false
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end