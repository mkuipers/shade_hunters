class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :character_card
  belongs_to :user
end