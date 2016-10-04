class TicketTypeAuthorizer < ApplicationAuthorizer
  def self.readable_by?(user, *opts)
    puts "OPTS:  ", opts
    true
  end
end