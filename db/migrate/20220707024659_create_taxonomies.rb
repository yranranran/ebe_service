class CreateTaxonomies < ActiveRecord::Migration[7.0]
  def change
    create_table :taxonomies, id: :uuid do |t|
      t.string :name, null:false
      t.string :type, null:false

      t.timestamps
    end
  end
end
