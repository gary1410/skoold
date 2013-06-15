class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.integer :subject_id
      t.integer :class_id
      t.string :message
      t.string :memo
      t.timestamps
    end
  end
end
