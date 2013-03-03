class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
