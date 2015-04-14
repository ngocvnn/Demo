class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :title
      t.text :content
      t.integer :user_id, index: true

      t.timestamps null: false
    end
    add_foreign_key	:statuses, :users
    add_index :statuses, [:user_id, :created_at]
  end
end
 