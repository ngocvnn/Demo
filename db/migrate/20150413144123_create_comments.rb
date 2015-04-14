class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, index: true
      t.references :status, index: true
      t.timestamps null: false
    end
    add_foreign_key	:comments, :users
    add_foreign_key	:comments, :status
    add_index :comments, [:user_id, :created_at]
    add_index :comments, [:status_id, :created_at]
  end
end
