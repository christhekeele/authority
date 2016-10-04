class CreateTicketTypes < ActiveRecord::Migration
  def change
    create_table :ticket_types do |t|

      t.timestamps
    end
  end
end
