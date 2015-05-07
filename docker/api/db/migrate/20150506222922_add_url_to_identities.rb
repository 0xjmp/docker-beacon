class AddUrlToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :url, :string
    add_index :identities, :url, unique: true
  end
end
