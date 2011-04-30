class DBCmd < YAIB::Responder
	def matcher
		"learn "
	end
	
	def execute(msg)
		stripped = msg.message.gsub(/Paily: learn /,'')
		input, output = stripped.split(" <reply> ")
		if input and output then
			res = Response.new
			res.input = input.downcase
			res.output = output
			msg.privmsg("Added") if res.save
		else
			msg.privmsg("#{msg.user.nick}: Input error")
		end
	end
end
