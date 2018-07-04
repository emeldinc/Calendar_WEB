class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
      create_table :appointments do |t|
      t.string :title
      t.text :comment
 	  t.date :date
 	  t.time :start_time
 	  t.time :end_time
 	  t.timestamps
    end
  end
end
