class CreateEvidenceSources < ActiveRecord::Migration[7.0]
  def change
    create_table :evidence_sources, id: :uuid do |t|
      t.references :evidence, null: false, foreign_key: true, type: :uuid
      t.references :source, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
