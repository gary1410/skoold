class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :tutor_id
      t.string :device_id

      t.timestamps
    end
  end
end
