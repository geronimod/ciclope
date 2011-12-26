require "ciclope/ring"
require "ciclope/host"
require "ciclope/version"

module Ciclope

  class << self
    attr_accessor :connections, :auto_sort_connections
  end
  self.auto_sort_connections = true

  def self.auto_sort?
    auto_sort_connections
  end

  def self.ring
    @ring ||= Ring.new(connections, :sort_hosts => auto_sort?)
  end

  def self.replication_status
    ring.hosts.map &:status
  end
  
  def self.replication_seconds_behind_master
    out = ring.hosts.map do |host|
      host.name + " ––– #{host.seconds_behind_master} seconds –––> "
    end
    out << ring.hosts.first.name
    out.join
  end
  
end
