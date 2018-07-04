class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
      create_table :appointments do |t|
      t.string :title
      t.text :comment
 	  t.datetime :date
 	  t.timestamps
    end
  end
end
