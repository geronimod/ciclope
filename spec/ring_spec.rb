require File.dirname(__FILE__) + '/../lib/ciclope.rb'
 
module Rails
end 
 
describe Ciclope::Ring do
  before do
    config = mock :configuration, :database_configuration => { :c1 => {}, :c2 => {} }
    Rails.stub!(:configuration).and_return(config)
  end
  
  it "must be configurated with two or more connection names through 'Ciclope.connections' class variable" do
    lambda { Ciclope::Ring.new }.should raise_exception(Ciclope::Ring::NotEnoughConnections) 
  end

  it "must be valid" do
    r = Ciclope::Ring.new(:c1, :c2)
    r.should be_an_instance_of Ciclope::Ring
  end
 
end