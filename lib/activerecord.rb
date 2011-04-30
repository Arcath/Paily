ActiveRecord::Base.establish_connection(YAML::load(File.open('database.yml')))
ActiveRecord::Base.logger = Logger.new("log/db.log", "weekly")
