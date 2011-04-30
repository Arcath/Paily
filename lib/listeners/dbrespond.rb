class DBRespond < YAIB::Responder
	def listen(msg)
		res = Response.find_by_input(msg.message.downcase.chomp)
		msg.privmsg(res.output) if res
	end
end
