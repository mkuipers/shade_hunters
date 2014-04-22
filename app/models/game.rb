class Game < ActiveRecord::Base
  has_many :players
  belongs_to :current_player, class_name: "Player"
  # These could probably be refactored to just scopes instead of requiring seperate classes and STI.
  # Whatever.
  has_many :green_deck_cards, through: :green_card_in_deck
  has_many :black_deck_cards, through: :black_card_in_deck
  has_many :white_deck_cards, through: :white_card_in_deck
  has_many :green_discard_cards, through: :green_card_in_discard
  has_many :black_discard_cards, through: :black_card_in_discard
  has_many :white_discard_cards, through: :white_card_in_discard

  validate :number_of_players
  validates :area_card_1,
            :area_card_2,
            :area_card_3,
            :area_card_4,
            :area_card_5,
            :area_card_6, presence: true

  # Creating a new game requires an array of users
  def initialize(users:)
    super nil
    raise ArgumentError unless users.size < 9 && users.size > 3
    # pick the character cards based on the number of players in the game
    character_cards = CharacterCards.send("pick_#{users.size}").shuffle

    # create the players by character card with user
    character_cards.each_with_index do |cc, i|
      players << Player.new(character_card: cc, user: users[i], turn_order: i)
    end

    #create the area cards
    #TODO: make the area cards an array.
    shuffled_area_cards = AreaCards.all.shuffle
    (1..6).each { |i| send("area_card_#{i}=", shuffled_area_cards[i-1] ) }


    # # create the decks
    # white_deck_cards = WhiteCard.all
    # green_deck_cards = GreenCard.all
    # black_deck_cards = BlackCard.all
    # white_discard_cards = []
    # green_discard_cards = []
    # black_discard_cards = []
  end

  #validation
  def number_of_players
    errors.add(:players, "too many players") if players.size > 8
    errors.add(:players, "too few players") if players.size < 4
  end

  def ended?
    false
  end

  def hunters
    players.keep_if(&:hunter?)
  end

  def shadows
    players.keep_if(&:shadow?)
  end

  def neutrals
    players.keep_if(&:neutral?)
  end
end