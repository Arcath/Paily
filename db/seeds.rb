[
	["i like it", "Then put a ring on it"]
].each do |seed|
	response = Response.find_or_create_by_input(seed[0])
	response.output = seed[1]
	response.save
end
