require 'machinist/active_record'

Game.blueprint do
  players {Player.make(8)}
end

Player.blueprint do
  user { User.make }
end

User.blueprint do
end
