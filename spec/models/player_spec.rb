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
      game.players.first.current_health = 0
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

  context '#kills and #killed_by' do
    subject { game.players.first }
    let(:slain_player_1) { game.players[1] }
    let(:slain_player_2) { game.players[2] }

    before do
      slain_player_2.killed_by = subject
      slain_player_1.killed_by = subject
      slain_player_1.save!
      slain_player_2.save!
      subject.reload
    end

    it "should have two players in the #kills collection" do
      expect(subject.kills.size).to eq(2)
    end

    it "should have the two slain players in #kills collection" do
      expect(subject.kills).to match_array([slain_player_1, slain_player_2])
    end

  end

  context '#equipment' do
  end

  context '#special_ability_used?' do
  end

  context '#won?' do
  end
end