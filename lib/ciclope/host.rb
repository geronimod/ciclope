module Ciclope
  class Host
    include Comparable
  
    attr_reader :connection, :config

    def initialize(connection)
      @connection = connection
      @config     = @connection.instance_variable_get '@config'
    
      # define every key as a method
      status.keys.each do |m|
        self.class.send :define_method, m.downcase do
          status[m]
        end
      end
    end

    def name
      @config[:host]
    end

    def status
      @connection.select_one 'SHOW SLAVE STATUS'
    end
  
    def log_file
      cleanfy_log_name relay_log_file.split('.').first
    end
  
    def master_log_file
      cleanfy_log_name relay_master_log_file.split('.').first
    end
  
    # sort by log file names, there is no way to do this by host names, may be there is another way to do this more clean
    # TODO: find the right sort
    def <=>(other)
      if log_file == other.master_log_file
        1
      elsif other.log_file == master_log_file
        -1
      else
        0
      end
    end
  
    private
      def cleanfy_log_name(name)
        name.gsub(/(binary|relay)log/i, '').
             gsub(/[_\-\d]/, '')
      end
  
  end
end