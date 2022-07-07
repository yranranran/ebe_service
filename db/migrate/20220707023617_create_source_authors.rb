class CreateSourceAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :source_authors, id: :uuid do |t|
      t.references :author, null: false, foreign_key: true, type: :uuid
      t.references :source, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
