class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email,            null: false
      t.string :crypted_password
      t.string :user_name, null: false
      t.integer :role, default: 0
      t.datetime :deleted_at
      t.string :salt

      t.timestamps                null: false
    end

    add_index :users, :email, unique: true, where: 'deleted_at IS NULL' 
  end
end
