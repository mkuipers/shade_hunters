class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  scope :dead -> do
    where("current_health" => 0 )
  end

  scope :living -> do
    where("current_health > 0")
  end

  def kills
    0
  end

  def equipment
    []
  end

  def special_ability_used?
    false
  end
end