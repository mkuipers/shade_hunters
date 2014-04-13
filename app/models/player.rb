class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  def initialize(character_card:, user:, turn_order:)
    super(user: user, turn_order: turn_order, current_health: character_card.max_hp, character_name: character_card.name )
  end

  scope :dead, -> do
    where("current_health" => 0 )
  end

  scope :living, -> do
    where("current_health > 0")
  end

  def character_card
    CharacterCards.by_name[character_name]
  end

  def kills
    0
  end

  def equipment
    []
  end

  def special_ability_used?
    false
  end
end