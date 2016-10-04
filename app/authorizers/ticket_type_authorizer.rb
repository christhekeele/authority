class TicketTypeAuthorizer < ApplicationAuthorizer
  def self.readable_by?(user, *opts)
    puts "OPTS:"
    puts opts
    true
  end
end