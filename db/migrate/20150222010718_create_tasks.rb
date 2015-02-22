class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :phrase
      t.integer :phone_number
      t.datetime :completed_at
      t.integer :user_id

      t.timestamps
    end
  end
end
