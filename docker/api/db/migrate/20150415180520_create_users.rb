class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :visible, null: false, default: false
      t.timestamps
    end

    create_table :identities do |t|
      t.string :uid, null: false
      t.string :provider, null: false
      t.belongs_to :user, null: false
      t.timestamps
    end

    add_index :identities, :user_id
  end
end
