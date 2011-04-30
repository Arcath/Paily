class Response < ActiveRecord::Base
	def r_output(msg)
		output.gsub(/\+nick\+/,msg.user.nick)
	end
end
