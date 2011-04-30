require 'rubygems'
require 'logger'
require 'active_record'
require 'yaml'

desc "Migrate the database through scripts in db/migrate."
task :migrate => :environment do
	ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
end

task :seed => :environment do
	require 'db/seeds'
end

task :environment do
	ActiveRecord::Base.establish_connection(YAML::load(File.open('database.yml')))
	ActiveRecord::Base.logger = Logger.new("log/db.log", "weekly")
end
