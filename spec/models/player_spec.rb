require 'spec_helper'

describe Player do

  context '#allegiance' do
    let (:users) {User.make(8)}
    let (:game) { Game.new(users: users) }
    subject { game.players.first }
    it 'delegates properly' do
      expect(subject.allegiance).to eq(subject.character_card.allegiance)
    end
  end

  context '.dead' do
  end

  context '.living' do
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