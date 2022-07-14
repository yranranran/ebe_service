class RenameTaxonomyColumnToTag < ActiveRecord::Migration[7.0]
  def change
    rename_column :article_tags, :taxonomy_id, :tag_id
  end
end
