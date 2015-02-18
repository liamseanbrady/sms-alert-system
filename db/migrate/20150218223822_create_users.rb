class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :role, default: 'branch'
      t.integer :phone_number

      t.timestamps
    end
  end
end
