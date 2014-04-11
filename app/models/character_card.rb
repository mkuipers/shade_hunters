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
    attr_reader :name, :max_hp, :allegiance, :win_condition, :special_ability

    def hunter?
      allegiance == 'hunter'
    end

    def shadow?
      allegiance == 'shadow'
    end

    def neutral?
      allegiance == 'neutral'
    end
  end

  class NeutralCharacterCard < CharacterCard
    def initialize(name:, max_hp:, win_condition:, special_ability:)
      @allegiance = 'neutral'
      @name = name
      @max_hp = max_hp
      @win_condition = win_condition
      @special_ability = special_ability
    end
  end

  class ShadowCharacterCard < CharacterCard
    def initialize(name:, max_hp:, special_ability:)
      @allegiance = 'shadow'
      @name = name
      @max_hp = max_hp
      @special_ability = special_ability
      # set win condition - all hunters dead or 3 neutrals dead
    end
  end

  class HunterCharacterCard < CharacterCard
    def initialize(name:, max_hp:, special_ability:)
      @allegiance = 'hunter'
      @name = name
      @max_hp = max_hp
      @special_ability = special_ability
      # set win condition - all shadows dead
    end
  end
end