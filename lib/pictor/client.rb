require 'blather/client/dsl'
require 'em-http'
require 'yajl'

# Seems like Ejabberd sends back a buggy stanza with the namespace set to "",
# so register that namespace as a standard Blather::Stanza::Message.
Blather::Stanza::Message.register(:message , 'message', '')

module Pictor
  class Client
    include Blather::DSL

    attr_accessor :jid, :pass, :room, :nick, :key

    def run
      setup @jid, @pass

      # Join the MUC Chat room after connecting.
      when_ready do
        puts "Connected!"
        p = Blather::Stanza::Presence.new
        p.from = @jid
        p.to = "#{@room}/#{@nick}"
        p << "<x xmlns='http://jabber.org/protocol/muc'/>"
        client.write p
      end

      message :groupchat?, :body => /^Pictor:/ do |m|
        rxp = Regexp.new('Pictor: (.*)', 'i')
        query = rxp.match(m.body)[1]
        puts "Searching: #{query}"
        http = EventMachine::HttpRequest.new('http://ajax.googleapis.com/ajax/services/search/images').get(:query => {'key' => @key, 'v' => '1.0', 'q' => query}, :timeout => 10)
        http.errback { puts 'Search Failed' }
        http.callback {
          r = Yajl::Parser.parse(http.response)
          url = r['responseData']['results'].first['url']
          puts "Returning: #{url}"
          m = Blather::Stanza::Message.new
          m.to = @room
          m.type = :groupchat
          m.body = url
          client.write m
        }
      end

      client.run
    end
  end
end
