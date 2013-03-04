class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :asset_id
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
