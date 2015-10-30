require 'part1.rb'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe "#palindrome?" do
  it "should be defined" do
    lambda { palindrome?("Testing") }.should_not raise_error
  end
end

describe "#count_words" do
  it "should be defined" do
    lambda { count_words("Testing") }.should_not raise_error
  end

  it "should return a Hash" do
    count_words("Testing").class.should == Hash
  end
  
  it "The counting method returns the correct counts" do
    expect(count_words("i is smart! I is beautiful. I is important. ")).to eq({"i" => 3, "is" => 3, "smart" => 1, "beautiful" => 1, "important" => 1})
  end
end
