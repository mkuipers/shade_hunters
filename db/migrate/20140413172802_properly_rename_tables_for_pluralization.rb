class ProperlyRenameTablesForPluralization < ActiveRecord::Migration
  def change
    rename_table :action_card, :action_cards
    rename_table :action_log, :action_logs
    rename_table :card_in_pile, :card_in_piles
    rename_table :win, :wins
  end
end
