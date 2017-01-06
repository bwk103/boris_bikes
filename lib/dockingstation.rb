require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :docked_bikes, :working_bikes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @working_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "There are no working bikes available!" if empty?
    @working_bikes.pop
  end

  def dock(bike)
    raise "This docking_station is full!" if full?
      @docked_bikes << bike
      if bike.broken == false
        @working_bikes << bike
      end
  end

  def dock_broken(bike)
    "Is the Bike working?"
  end

private

  def full?
    @docked_bikes.length >= @capacity
  end

  def empty?
    @working_bikes.empty?
  end

end
