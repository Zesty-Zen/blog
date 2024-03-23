class ChangeCommentStatusDatatype < ActiveRecord::Migration[7.1]
  def change
    change_column :comments, :status, :integer
  end
end
