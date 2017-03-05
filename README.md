# Boris Bike Challenge

As part of week 1 at Makers Academy, I have been asked to build a program that will emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to manage the Boris Bike system.

## User Stories

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).

```
## Technology

This project has been built using Ruby and Rspec for testing.

## Installation

 * $ git clone/fork this repository

 * $ gem install bundler (if necessary)

 * $ bundle install

 * $ irb

 * $ require './lib/bike.rb'

 * $ require './lib/dockingstation.rb'

## Tests

In order to run the tests, run the following command:

* $ rspec


## Usage

Having required both 'bike.rb' and 'dockingstation.rb' in irb, use the following example commands to navigate the application:

#### Create Bike
  * $ bike = Bike.new

#### Create Docking Station
  * $ docking_station = Dockingstation.new

#### Dock Bike
  * $ docking_station.dock(bike)

#### Release Bike
  * $ docking_station.release_bike

#### Check Bike is Working
  * $ bike.working?

#### Report Bike is Broken
  * $ bike.report_broken

NB: Each docking station has a default capacity of 20 bikes and will not release broken bikes.


## Future Enhancements

Possible future enhancements to this project include refactoring the code and tests so as to better use 'doubles' in Rspec and implementing a front end for ease of use.


## Contributors

This project was produced as a result of pair programming with different individuals throughout the week.  The following individuals have contributed to this project:

* Shoniwa Marovatsanga
* Rick Clark
* Ben Kielty
