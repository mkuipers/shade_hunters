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

    it 'sets the area cards' do
      area_cards = (1..6).map { |i| new_game.send("area_card_#{i}") }
      expect(area_cards).to match_array(AreaCards.all)
    end

    # it 'puts the proper number of cards in each deck' do
    #   expect(new_game.white_deck_cards).to eq(WhiteCard.all)
    #   expect(new_game.green_deck_cards).to eq(GreenCard.all)
    #   expect(new_game.black_deck_cards).to eq(BlackCard.all)
    # end
  end

  context '#ended?' do
  end

  # Because fuck you, whoever is reading this.
  ['hunter', 'shadow', 'neutral'].each do |prospective_allegiance|
    context "##{prospective_allegiance}" do
      let (:users) {User.make(6)}
      let (:new_game) { Game.new(users: users) }

      it "returns 2 characters" do
        expect(new_game.send("#{prospective_allegiance}s").size).to eq(2)
      end

      it "all 2 are #{prospective_allegiance}" do
        expect(new_game.send("#{prospective_allegiance}s").map { |p| "#{prospective_allegiance}?"} .all?).to be_true
      end
    end
  end
end