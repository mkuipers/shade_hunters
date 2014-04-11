require 'spec_helper'

describe Game do
  subject { Game.make }

  it { expect(subject).to be_valid }
end