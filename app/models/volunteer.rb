class Volunteer < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_and_belongs_to_many :chatrooms
end
