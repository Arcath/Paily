require 'rubygems'
require 'yaib'
require 'active_record'
require 'yaml'
require 'lib/activerecord'
require 'lib/models/response'
require 'lib/listeners/dbrespond'
require 'lib/commands/dbcmds'

YAIB.construct do |c|
	c.nick = "Paily"
	c.server = "irc.freenode.net"
	c.channels = ["#whitefall"]
	c.commands = [DBCmd]
	c.listeners = [DBRespond]
	c.prefix = "Paily: "
end
