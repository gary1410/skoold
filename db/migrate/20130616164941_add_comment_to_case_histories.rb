class AddCommentToCaseHistories < ActiveRecord::Migration
  def change
    add_column :case_histories, :comment, :string
  end
end
