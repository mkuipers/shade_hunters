module CharacterCards
  def self.pick_4
    # 2 shadows
    # 2 hunters
  end

  def self.pick_5
    # 2 shadows
    # 2 hunters
    # 1 neutral
  end

  def self.pick_6
    # 2 shadows
    # 2 hunters
    # 2 neutrals
  end

  def self.pick_7
    # 2 shadows
    # 2 hunters
    # 3 neutrals
  end

  def self.pick_8
    # 3 shadows
    # 3 hunters
    # 2 neutrals
  end

  class CharacterCard
  end

  class NeutralCharacterCard < CharacterCard
  end

  class ShadowCharacterCard < CharacterCard
  end

  class HunterCharacterCard < CharacterCard
  end
end