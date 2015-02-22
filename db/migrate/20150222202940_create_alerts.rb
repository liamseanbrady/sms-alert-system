class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :phrase

      t.timestamps
    end
  end
end
