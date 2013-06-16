class AddSex < ActiveRecord::Migration
  def change
    add_column :students, :sex, :string, :default => 'f', :null => false
  end
end
