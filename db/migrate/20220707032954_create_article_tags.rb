class CreateArticleTags < ActiveRecord::Migration[7.0]
  def change
    create_table :article_tags, id: :uuid do |t|
      t.references :taxonomy, null: false, foreign_key: true, type: :uuid
      t.integer :articable_id
      t.string :articable_type

      t.timestamps
    end
  end
end
