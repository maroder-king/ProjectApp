class ChangeColumnTypeDefaults < ActiveRecord::Migration
  def change
    change_column :tasks, :status, :string, default: "to_do"
  end
end
