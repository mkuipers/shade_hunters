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
- CharacterCard
  - name
  - max hp
  - allegiance
  - special ability
  - win condition
- ActionLog
  - ActionClassName
  - has_one Actor (player)
  - has_many receivers (player)
- Turn
  - player
  - turn_phase [start, move, resolve, target, attack, end]


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

