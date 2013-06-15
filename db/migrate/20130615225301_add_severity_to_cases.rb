class AddSeverityToCases < ActiveRecord::Migration
  def change
    add_column :cases, :severity, :float
  end
end
