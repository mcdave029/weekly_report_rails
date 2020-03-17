class AddNameToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :name, :string
  end
end
