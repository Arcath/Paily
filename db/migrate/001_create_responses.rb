class CreateResponses < ActiveRecord::Migration
	def self.up
		create_table :responses do |t|
			t.string :input
			t.string :output
		end
	end
	
	def self.down
		drop_table :responses
	end
end
