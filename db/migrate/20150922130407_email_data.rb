class EmailData < ActiveRecord::Migration
  def change
    create_table :email_data do |t|
      t.string :address
      t.string :email_type
      t.string :event
      t.datetime :timestamp

      t.index :event
    end
  end
end
