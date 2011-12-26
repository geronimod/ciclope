require File.dirname(__FILE__) + '/../lib/ciclope.rb'
 
describe Ciclope do
 it "connections must be configurated with two or more connection names through 'connections' class variable" do
   lambda { Ciclope.replication_seconds_behind_master }.should raise_exception(Ciclope::Ring::NotEnoughConnections) 
 end
 
end