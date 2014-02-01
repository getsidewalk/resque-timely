require File.expand_path("../test_helper.rb", __FILE__)

describe Resque::Plugins::Timely do
  it "times out when timely but too slow" do
    ->{
      Resque.enqueue PoorlyBehavedTimelyJob
    }.must_raise Timeout::Error
  end
  
  it "doesn't time out when timely but fast enough" do
    Resque.enqueue WellBehavedTimelyJob
    WellBehavedTimelyJob.some_state.must_equal "anything but something"
  end
  
  it "doesn't act timely if the module is not included" do
    Resque.enqueue UntimelyJob
    UntimelyJob.some_state.must_equal "anything but something"
  end

  it "doesn't act timely if the timely_timeout method is not implemented" do
    Resque.enqueue ConfusedJob
    ConfusedJob.some_state.must_equal "anything but something"
  end
end