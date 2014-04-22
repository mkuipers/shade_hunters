require 'machinist/active_record'
Game.blueprint do
end
Player.blueprint do
  user { User.make }
end

User.blueprint do
end
