class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :theme,     nill: false
      t.text :goal,        nill: false
      t.references :user,  nill: false, foreign_key: true
      t.timestamps
    end
  end
end
