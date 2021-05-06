class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :age,         nill: false
      t.string :weight,      nill: false
      t.references :user,    nill: false, foreign_key: true
      t.timestamps
    end
  end
end
