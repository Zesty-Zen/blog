class ChangeStatusDatatypeToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :articles, :status, :integer
  end
end
