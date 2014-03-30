# Shadow Hunters
## Data model
Persited:

- Player
  - A player is an active participant in a Game
  - belongs_to user
  - belongs_to game
  - has one CharacterCard
  - Current Health
  - Current position (AreaCard)
  - Revealed?
  - turn order position
- Game
  - Game has 4-8 players
  - deck B/G/W
  - discard B/G/W
  - has_one win
  - has_many ActionLogs
  - has_one current_turn
  - area card layout (encoded in some intelligent way)
  - current_player
  - turn_phase
- CharacterCard
  - name
  - max hp
  - allegiance
  - special ability
  - win condition
- ActionLog
  - ActionClassName
  - belongs_to Actor (player)
  - belongs_to receivers (player)
- Win
  - if the game is over, there is a win record for the game with all the characters that have won.
- ActionCard
  - for the discard/decks of



Game model logic:

- Actions (things that change the state of the game)
  - Roll to Move
  - Basic attack
  - Draw card
  - Target player with action
  - Use Card
  - Respond to card
  - Use special
  - Reveal Character card
  - Region 10
  - Region 9

