require 'pictor/client'

module Pictor
  def self.run!(*args)
    EM.run do
      p = Pictor::Client.new
      p.jid = args[0] || ENV['JID']
      p.pass = args[1] || ENV['PASS']
      p.room = args[2] || ENV['ROOM']
      p.nick = args[3] || ENV['NICK']
      p.key = args[4] || ENV['KEY']
      p.run
    end
  end
end

trap(:INT) { EM.stop }
trap(:TERM) { EM.stop }
