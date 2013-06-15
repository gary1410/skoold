class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :picture
      t.string :description

      t.timestamps
    end
  end
end
