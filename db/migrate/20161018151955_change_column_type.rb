class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :tasks, :status, :string
  end
end
