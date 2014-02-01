require "rubygems"
require "bundler"
Bundler.require(:default, :test)

$:.unshift File.expand_path("../../lib", __FILE__)
require "resque-timely"

require "minitest/autorun"

Resque.inline = true

class PoorlyBehavedTimelyJob
  include Resque::Plugins::Timely
  @queue = :poorly_behaved
  
  def self.timely_timeout
    1.9
  end
  
  def self.perform
    sleep 2
  end
end

class WellBehavedTimelyJob
  include Resque::Plugins::Timely
  @queue = :well_behaved
  @some_state = nil
  
  def self.some_state
    @some_state
  end
  
  def self.timely_timeout
    3
  end
  
  def self.perform
    sleep 2
    @some_state = "anything but something"
  end
end

class UntimelyJob
  @queue = :untimely
  @some_state = nil
  
  def self.some_state
    @some_state
  end

  def self.perform
    @some_state = "anything but something"
  end
end

class ConfusedJob
  include Resque::Plugins::Timely
  @queue = :confused
  @some_state = nil
  
  def self.some_state
    @some_state
  end

  def self.perform
    @some_state = "anything but something"
  end
end
