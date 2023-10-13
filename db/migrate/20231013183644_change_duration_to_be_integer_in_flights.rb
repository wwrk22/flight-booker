class ChangeDurationToBeIntegerInFlights < ActiveRecord::Migration[7.0]
  def up 
    remove_column :flights, :duration
    add_column :flights, :duration, :integer
  end

  def down 
    remove_column :flights, :duration
    add_column :flights, :duration, :datetime
  end
end
