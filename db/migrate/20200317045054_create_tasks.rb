class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.datetime :start_at
      t.datetime :end_at
      t.string :status
      t.text :references
      t.text :comments

      t.timestamps
    end
  end
end
