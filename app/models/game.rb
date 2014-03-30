class Game < ActiveRecord::Base
  has_many :players
  belongs_to :current_player, class_name: "Player"
  # These could probably be refactored to just scopes instead of requiring seperate classes and STI.
  # Whatever.
  has_many :green_deck_cards, through: :green_card_in_deck
  has_many :black_deck_cards, through: :black_card_in_deck
  has_many :white_deck_cards, through: :white_card_in_deck
  has_many :green_discard_cards, through: :green_card_in_discard
  has_many :black_discard_cards, through: :black_card_in_discard
  has_many :white_discard_cards, through: :white_card_in_discard
end