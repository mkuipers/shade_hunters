require 'spec_helper'

describe Player do
  let (:users) {User.make(6)}
  let (:game) { Game.create!(users: users) }


  context '#allegiance' do
    subject { game.players.first }
    it 'delegates properly' do
      expect(subject.allegiance).to eq(subject.character_card.allegiance)
    end
  end

  context '.dead' do
    before do
      game.players.first.current_health - game.players.first.current_health
      puts game.players.first.current_health
      game.players.first.save!
    end

    it "returns the currect number of dead players" do
      expect(game.players.dead.size).to eq(1)
    end
  end

  context '.living' do
    it 'should have all players living right off the bat' do
      expect(game.players.living.size).to eq(6)
    end
  end

  context '#kills' do
  end

  context '#equipment' do
  end

  context '#special_ability_used?' do
  end

  context '#won?' do
  end
end