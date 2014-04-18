require 'spec_helper'

describe CharacterCards do
  describe 'character card distributions' do
    context '.pick_4' do
      subject { CharacterCards.pick_4 }

      it "picks 4 cards" do
        expect(subject.size).to eq(4)
      end

      it "picks 2 hunters and 2 shadows" do
        expect(subject.map(&:allegiance)).to match_array(["shadow", "shadow", "hunter", "hunter"])
      end
    end

    context '.pick_5' do
      subject { CharacterCards.pick_5 }

      it "picks 5 cards" do
        expect(subject.size).to eq(5)
      end

      it "picks 2 hunters, 2 shadows, and one neutral" do
        expect(subject.map(&:allegiance)).to match_array(["shadow", "shadow", "hunter", "hunter", "neutral"])
      end
    end

    context '.pick_6' do
      subject { CharacterCards.pick_6 }

      it "picks 6 cards" do
        expect(subject.size).to eq(6)
      end

      it "picks 2 hunters, 2 shadows, and two neutrals" do
        expect(subject.map(&:allegiance)).to match_array(["shadow", "shadow", "hunter", "hunter", "neutral", "neutral"])
      end
    end

    context '.pick_7' do
      subject { CharacterCards.pick_7 }

      it "picks 7 cards" do
        expect(subject.size).to eq(7)
      end

      it "picks 2 hunters, 2 shadows, and three neutrals" do
        expect(subject.map(&:allegiance)).to match_array(["shadow", "shadow", "hunter", "hunter", "neutral", "neutral", "neutral"])
      end
    end

    context '.pick_8' do
      subject { CharacterCards.pick_8 }

      it "picks 7 cards" do
        expect(subject.size).to eq(8)
      end

      it "picks 3 hunters, 3 shadows, and 2 neutrals" do
        expect(subject.map(&:allegiance)).to match_array(["shadow", "shadow", "hunter", "hunter", "neutral", "neutral", "hunter", "shadow"])
      end
    end
  end

  describe 'win conditions' do
    context 'HUNTER_WIN_CONDITION' do

    end

    context 'AGNES_WIN_CONDITION' do

    end
  end
end