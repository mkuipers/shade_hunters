class AddInitialModels < ActiveRecord::Migration
  def change
    execute 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'

    create_table :players, force: true, id: :uuid do |t|
      t.uuid    :game_id, null: false
      t.uuid    :character_card_id, null: false
      t.integer :current_health, null: false
      t.string  :current_location
      t.boolean :revealed, default: false
      t.integer :turn_order
    end

    create_table :games, force: true, id: :uuid do |t|
      t.string  :area_card_1, null: false
      t.string  :area_card_2, null: false
      t.string  :area_card_3, null: false
      t.string  :area_card_4, null: false
      t.string  :area_card_5, null: false
      t.string  :area_card_6, null: false
      t.uuid    :current_player_id
      t.string  :turn_phase
    end

    create_table :character_card, force: true, id: :uuid do |t|
      t.string  :name, null: false
      t.integer :max_hp, null: false
      t.string  :allegiance
      t.string  :special_ability
      t.string  :win_condition
    end

    create_table :action_log, force: true, id: :uuid do |t|
      t.string  :type
      t.uuid    :actor,   null: false
      t.uuid    :receiver
    end

    create_table :win, force: true, id: :uuid do |t|
      t.uuid  :game_id, null: false
      t.uuid  :player_id, null: false
    end

    create_table :card_in_pile, force: true, id: :uuid do |t|
      t.string :type
      t.uuid :action_card_id, null: false
      t.uuid :game_id, null: false
      t.index :action_card_id, :game_id, unique: true
    end

    create_table :action_card, force: true, id: :uuid do |t|
      t.string :type
      t.string :name
    end
  end
end
