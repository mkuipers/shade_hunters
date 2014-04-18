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

    it 'makes the proper distribution of shadows, neutrals, and hunters' do
      expect(new_game.players.map(&:allegiance) ).to match_array(['hunter','hunter','hunter','shadow','shadow', 'shadow', 'neutral', 'neutral'])
    end

    # it 'puts the proper number of cards in each deck' do
    #   expect(new_game.white_deck_cards).to eq(WhiteCard.all)
    #   expect(new_game.green_deck_cards).to eq(GreenCard.all)
    #   expect(new_game.black_deck_cards).to eq(BlackCard.all)
    # end
  end

  context '#ended?' do
  end

  context '#hunters' do
    let (:users) {User.make(8)}
    let (:new_game) { Game.new(users: users) }

    it "returns 3 characters" do
      expect(new_game.hunters.size).to eq(3)
    end

    it "all 3 are hunters" do
      expect(new_game.hunters.map(&:allegiance).uniq).to match_array(["hunter"])
    end
  end

  context '#shadows' do
  end

  context '#neutrals' do
  end

end