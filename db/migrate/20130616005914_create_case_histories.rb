class CreateCaseHistories < ActiveRecord::Migration
  def change
    create_table :case_histories do |t|
      t.integer :case_id
      t.integer :admin_user_id
      t.string :status
      t.timestamps
    end
  end
end
