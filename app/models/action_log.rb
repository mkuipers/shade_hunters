class ActionLog < ActiveRecord::Base
  belongs_to :actor, class_name: "Player"
  belongs_to :receiver, class_name: "Player"
end