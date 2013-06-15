class AddDeviceIdToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :device_id, :string
  end
end
