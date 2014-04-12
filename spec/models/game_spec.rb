require 'spec_helper'

describe Game do

  context 'setting up a game' do
    let (:users) {User.make(8)}
    let (:new_game) { Game.new(users: users) }

    it "Properly creates a valid new game" do
      expect(new_game).to be_valid
    end

    it 'puts the proper number of players in the game' do
      expect(new_game.players.size).to eq(8)
    end

    it 'puts the proper number of cards in each deck' do
      expect(new_game.white_deck_cards).to eq(WhiteCard.all)
      expect(new_game.green_deck_cards).to eq(GreenCard.all)
      expect(new_game.black_deck_cards).to eq(BlackCard.all)
    end
  end

  context '#ended?' do
  end

  context '#hunters' do
  end

  context '#shadows' do
  end

  context '#neutrals' do
  end

end