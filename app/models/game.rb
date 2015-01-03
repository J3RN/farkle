class Game < ActiveRecord::Base

  def self.roll(num_dice)
    Array.new(num_dice) {|index| Random.rand(6) + 1}
  end

  ## Calculate score
  # This is based off of the rules found here: http://en.wikipedia.org/wiki/Farkle
  # Date of access: 2015-01-02
  def self.point_value(values)
    points = 0

    # Check for threes condition first
    grouped = values.group_by {|value| values.count(value)}
    if grouped.keys.count(3) >= 1
      # Get an array of values of which there are three occurrances
      threes = grouped.keep_if {|count, value| count == 3}.values.flatten.uniq

      threes.each do |three|
        if three == 1
          points += 1000
        else
          points += three * 100
        end

        # Delete counted values so they are not re-counted
        values.delete(three)
      end
    end

    # Add points for 1's and 5's
    points += values.count(1) * 100
    points += values.count(5) * 50

    points
  end
end
