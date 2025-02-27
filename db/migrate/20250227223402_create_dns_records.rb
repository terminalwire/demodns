class CreateDnsRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :dns_records do |t|
      t.references :domain, null: false, foreign_key: true
      t.string :host
      t.string :record_type
      t.string :value
      t.integer :ttl

      t.timestamps
    end
  end
end
