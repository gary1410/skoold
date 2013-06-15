class RenameClassToClassRoomInCases < ActiveRecord::Migration
  def change
    rename_column :cases, :class_id, :class_room_id
  end
end
