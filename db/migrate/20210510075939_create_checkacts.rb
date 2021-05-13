class CreateCheckacts < ActiveRecord::Migration[6.0]
  def change
    create_table :checkacts do |t|
      t.integer    :completion,   null: false
      t.references :motion,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
