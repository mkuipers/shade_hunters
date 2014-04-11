class RemoveCharacterCardModel < ActiveRecord::Migration
  def change
    drop_table :character_card
    remove_column :players, :character_card_id, :uuid
    add_column :players, :character_name, :string
  end
end
