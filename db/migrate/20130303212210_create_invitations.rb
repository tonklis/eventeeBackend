class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :message
      t.integer :event_id
      t.boolean :sent
      t.boolean :accepted

      t.timestamps
    end
  end
end
