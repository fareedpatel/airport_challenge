require 'spec_helper'
require './lib/airport'
require './lib/plane'

describe 'User Story' do
  # As an air traffic controller 
  # So I can get passengers to a destination 
  # I want to instruct a plane to land
  it 'so planes land at airpot, instruct a plane to land' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(false)
    expect { airport.land(plane) }.not_to raise_error
  end
  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off
  it 'so planes take off from airports, instruct a plane to take off' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land(plane)
    expect { airport.taking_off(plane) }.not_to raise_error
  end
  #  As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when the airport is full 
  it 'does not allow planes to land when airport is full' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(false)
    20.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'does not let plane land'
  end
  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent takeoff when weather is stormy
  it 'does not allow planes to land when weather is stormy?' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_error 'Bad weather'
  end
  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent takeoff when weather is stormy 
    it 'does not allow planes to land when weather is stormy' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.taking_off(plane) }.to raise_error 'Bad weather'
  end
  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
  it 'allows the default capacity to be overridden' do
  airport = Airport.new
  plane = Plane.new
  allow(airport).to receive(:stormy?).and_return(false)
  end
end