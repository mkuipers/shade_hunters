module CharacterCards
  def self.pick_4
    SHADOWS.sample(2) + HUNTERS.sample(2)
  end

  def self.pick_5
    SHADOWS.sample(2) + HUNTERS.sample(2) + NEUTRALS.sample(1)
  end

  def self.pick_6
    SHADOWS.sample(2) + HUNTERS.sample(2) + NEUTRALS.sample(2)
  end

  def self.pick_7
    SHADOWS.sample(2) + HUNTERS.sample(2) + NEUTRALS.sample(3)
  end

  def self.pick_8
    SHADOWS.sample(3) + HUNTERS.sample(3) + NEUTRALS.sample(2)
  end

  class CharacterCard
    attr_reader :name, :max_hp, :allegiance, :win_condition, :special_ability

    def initialize(name:, max_hp:, allegiance: )
      @allegiance = allegiance
      @name = name
      @max_hp = max_hp
      #@win_condition = find_win_condition
      #@special_ability = SpecialAbilities.all[name]
    end

    def hunter?
      allegiance == 'hunter'
    end

    def shadow?
      allegiance == 'shadow'
    end

    def neutral?
      allegiance == 'neutral'
    end

    def find_win_condition
      if neutral?
        NEUTRAL_WIN_CONDITIONS[name]
      elsif shadow?
        SHADOW_WIN_CONDITION
      else
        HUNTER_WIN_CONDITION
      end
    end
  end


  # ========== NEUTRALS ===========
  AGNES = CharacterCard.new(name: "Agnes", max_hp: 8, allegiance: "neutral")
  ALLIE = CharacterCard.new(name: "Allie", max_hp: 8, allegiance: "neutral" )
  BOB = CharacterCard.new(name: "Bob", max_hp: 10, allegiance: "neutral")
  BRIAN = CharacterCard.new(name: "Brian", max_hp: 10, allegiance: "neutral")
  CATHERINE = CharacterCard.new(name: "Catherine", max_hp: 11, allegiance: "neutral")
  CHARLES = CharacterCard.new(name: "Charles", max_hp: 11, allegiance: "neutral")
  DANIEL = CharacterCard.new(name: "Daniel", max_hp: 13, allegiance: "neutral")
  DAVID = CharacterCard.new(name: "David", max_hp: 13, allegiance: "neutral")

  # =========== SHADOWS ============
  ULTRA_SOUL = CharacterCard.new(name: "Ultra Soul", max_hp: 11, allegiance: "shadow")
  UNKNOWN = CharacterCard.new(name: "Unknown", max_hp: 11, allegiance: "shadow")
  VALKYRIE = CharacterCard.new(name: "Valkyrie", max_hp: 13, allegiance: "shadow")
  VAMPIRE = CharacterCard.new(name: "Vampire", max_hp: 13, allegiance: "shadow")
  WEREWOLF = CharacterCard.new(name: "Werewolf", max_hp: 14, allegiance: "shadow")
  WIGHT = CharacterCard.new(name: "Wight", max_hp: 14, allegiance: "shadow")

  # =========== HUNTERS ==============
  ELLEN = CharacterCard.new(name: "Ellen", max_hp: 10, allegiance: "hunter")
  EMI = CharacterCard.new(name: "EMI", max_hp: 10, allegiance: "hunter")
  FRANKLIN = CharacterCard.new(name: "Franklin", max_hp: 12, allegiance: "hunter")
  FUKA = CharacterCard.new(name: "Fu-ka", max_hp: 12, allegiance: "hunter")
  GEORGE = CharacterCard.new(name: "George", max_hp: 14, allegiance: "hunter")
  GREGOR = CharacterCard.new(name: "Gregor", max_hp: 14, allegiance: "hunter")

  NEUTRALS = [AGNES, ALLIE, BOB, BRIAN, CATHERINE, CHARLES, DANIEL, DAVID]
  SHADOWS = [ULTRA_SOUL, UNKNOWN, VALKYRIE, VAMPIRE, WEREWOLF, WIGHT]
  HUNTERS = [ELLEN, EMI, FRANKLIN, FUKA, GEORGE, GREGOR]

  # ====== Win Condition Function ====
  # A win condition function takes a game and optionally a player and
  # returns true if the win condition is met

  HUNTER_WIN_CONDITION = Proc.new do |game, player=nil|
    !game.shadows.living.any?
  end

  SHADOW_WIN_CONDITION = Proc.new do |game, player=nil|
    !game.hunters.living.any? || game.neutrals.dead == 3
  end

  # ====== Neutral win conditions ====
  AGNES_WIN_CONDITION = Proc.new do |game, player|
    # Find the player on whom Agnes's win condition depends
    subject_player_turn_order = player.special_ability_used? ? player.turn_order + 1 : player.turn_order - 1
    #TODO make sure Game#players orders by turn_order
    subject_game.players[subject_player_turn_order]
    game.ended? && subject_player.won?
  end

  ALLIE_WIN_CONDITION = Proc.new do |game, player|
    game.ended? && player.living?
  end

  CATHERINE_WIN_CONDITION = Proc.new do |game, player|
    # first to die
    ( !game.players.dead.any? && player.dead? ) ||
    # OR one of the last two characters standing
    ( game.ended? && game.players.living == 2 && player.living? )

    # TODO: Handle simultaneous deaths. Catherine wins in this case.
  end


end