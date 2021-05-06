class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.text :act,           null: false
      t.integer :amount,     null: false
      t.text :if_act,        null: false
      t.integer :if_amount,  null: false
      t.references :task,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
