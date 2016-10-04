class TicketType < ActiveRecord::Base
  include Authority::Abilities
end
