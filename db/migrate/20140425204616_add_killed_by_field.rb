class AddKilledByField < ActiveRecord::Migration
  def change
    add_column :players, :killed_by_id, :uuid
  end
end
