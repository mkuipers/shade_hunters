require 'machinist/active_record'

Player.blueprint do
  user { User.make }
end

User.blueprint do
end
