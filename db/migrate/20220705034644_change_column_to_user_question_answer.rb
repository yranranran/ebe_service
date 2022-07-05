class ChangeColumnToUserQuestionAnswer < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :id, :string
    change_column :questions, :id, :string
    change_column :answers, :id, :string
  end

  def down
    change_column :users, :id, :integer
    change_column :questions, :id, :integer
    change_column :answers, :id, :integer
  end
end
