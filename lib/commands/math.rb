class BotMath < YAIB::Responder
	include Math
	def matcher
		"what is "
	end
	
	def execute(msg)
		stripped = msg.message.gsub(/Paily: what is /,'')
		begin
			if stripped =~ /sleep/ or stripped =~ /eval/ or stripped =~ /Thread/ or stripped =~ /Timeout/ or stripped =~ /@/
				out = "Invalid input"
			else
				Timeout::timeout(1){
					out = Thread.new { $SAFE=4; eval stripped.gsub("^","**") }.value.inspect
				}
			end
		rescue SyntaxError
			out = "Syntax Error"
		rescue SecurityError
			out = "Insecure Operation"
		rescue ZeroDivisionError
			out = "Division by Zero"
		rescue Timeout::Error
			out = "Timeout"
		rescue => error
			out = error
		end
		msg.privmsg(out)
	end
end
