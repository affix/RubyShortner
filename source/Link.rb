require 'rubygems'
require 'sinatra'

class Link < ActiveRecord::Base
	after_create :create_key
	def incriment_clicks
		self.update_attribute 'clicks', self.clicks + 1
	end
	private
	
	def create_key
		self.key = self.id.base62_encode
	end
end 
