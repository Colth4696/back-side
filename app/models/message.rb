class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom, optional: true
end
