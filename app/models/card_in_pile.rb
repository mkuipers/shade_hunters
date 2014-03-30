class CardInPile < ActiveRecord::Base
  belongs_to :game
  belongs_to :action_card
end