class ChangeActionsToMotions < ActiveRecord::Migration[6.0]
  def change
    rename_table :actions, :motions
  end
end
