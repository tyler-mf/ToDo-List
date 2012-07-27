class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :title
      t.integer :state
      t.text :content

      t.timestamps
    end
  end
end
