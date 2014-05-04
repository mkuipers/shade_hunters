class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  has_many :kills, class_name: "Player", foreign_key: :killed_by_id
  belongs_to :killed_by, class_name: "Player"

  def initialize(character_card:, user:, turn_order:)
    super(user: user, turn_order: turn_order, current_health: character_card.max_hp, character_name: character_card.name )
  end

  scope :dead, -> do
    where("current_health" => 0 )
  end

  scope :living, -> do
    where("current_health > 0")
  end

  delegate :allegiance, to: :character_card
  delegate :hunter?, to: :character_card
  delegate :shadow?, to: :character_card
  delegate :neutral?, to: :character_card

  def character_card
    CharacterCards.by_name[character_name]
  end


  def equipment
    []
  end

  def special_ability_used?
    false
  end
end