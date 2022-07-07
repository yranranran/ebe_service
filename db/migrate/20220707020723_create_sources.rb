class CreateSources < ActiveRecord::Migration[7.0]
  def change
    create_table :sources, id: :uuid do |t|
      t.string :title
      t.text :body
      t.integer :evidence_level, default: 0
      t.integer :source_type, default: 0, null:false
      t.date :published_at

      t.timestamps
    end
  end
end
