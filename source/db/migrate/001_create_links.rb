class CreateLinks < ActiveRecord::Migration

	def self.up
		create_table :links do |t|
			t.string :url, :null=>false
			t.string :key
			t.string :clicks, :null=>false, :default => 0
			t.timestamps
		end
	end
	
	def self.down	
		drop_table :links
	end

end
