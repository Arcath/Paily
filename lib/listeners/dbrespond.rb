class DBRespond < YAIB::Responder
	def listen(msg)
		res = Response.find_by_input(msg.message.downcase.chomp)
		if res
			msg.privmsg(res.r_output(msg))
		else
			possibles = Response.where("input LIKE ?", "%++%")
			possibles.each do |possible|
				search = possible.input.gsub(/\+\+/,'')
				if msg.message =~ /#{search}/
					msg.privmsg(possible.r_output(msg))
				end
			end
		end
	end
end
