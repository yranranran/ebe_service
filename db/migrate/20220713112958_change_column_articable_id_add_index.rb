class ChangeColumnArticableIdAddIndex < ActiveRecord::Migration[7.0]
  def change
    remove_column :article_tags, :articable_id, :integer
    add_column :article_tags, :articable_id, :bigint, type: :uuid
  end
  add_index :article_tags, [:articable_type, :articable_id]
end
