class CreateIpfixes < ActiveRecord::Migration
  def change
    create_table :ipfixes do |t|
      t.string :host
      t.string :ip

      t.timestamps
    end
    add_index :ipfixes, :host, :unique => true
  end
end
