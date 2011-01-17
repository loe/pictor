require 'pictor/client'

module Pictor

  def self.run!(*args)
    EM.run do
      p = Pictor::Client.new
      p.jid = args[0]
      p.pass = args[1]
      p.room = args[2]
      p.nick = args[3]
      p.key = args[4]
      p.run
    end
  end
end

trap(:INT) { EM.stop }
trap(:TERM) { EM.stop }
