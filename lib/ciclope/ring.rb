module Ciclope
  class Ring
    class NotEnoughConnections < Exception
      def message
        "Connections must be more than once !"
      end
    end
    
    attr_reader :hosts
    
    def initialize(*args)
      options = args.pop if args.last.is_a? Hash
      options ||= {}
      connections = Array(args).flatten.compact.uniq
      
      @hosts = []

      connections.each do |c|
        config = Rails.configuration.database_configuration[c.to_s]
        next unless config && config['adapter'] == 'mysql'
        @hosts << Host.new(ActiveRecord::Base.mysql_connection(config))
      end

      raise NotEnoughConnections if connections.size < 2
      @hosts = @hosts.sort if options[:sort_hosts] && @hosts.count > 2
    end
    
  end
end