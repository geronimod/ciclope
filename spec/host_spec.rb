require File.dirname(__FILE__) + '/../lib/ciclope.rb'
 
describe Ciclope::Host do
 it "must be initialized with a mysql connection" do
   lambda { Ciclope::Host.new }.should raise_error
 end
 
 it "must be valid" do
   c = mock(:connection, :select_one => { "Master_Log_File" => "L", "Relay_Master_Log_File" => "ML", "Seconds_Behind_Master" => "0" })
   h = Ciclope::Host.new(c)
   h.should be_an_instance_of Ciclope::Host
 end
end