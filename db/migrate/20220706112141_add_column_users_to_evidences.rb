class AddColumnUsersToEvidences < ActiveRecord::Migration[7.0]
  def change
    add_reference :evidences, :user, type: :uuid, null: false, foreign_key: true
  end
end
