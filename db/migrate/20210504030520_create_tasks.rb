class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :theme,     nill: false
      t.text :goal,        nill: false

      t.timestamps
    end
  end
end
