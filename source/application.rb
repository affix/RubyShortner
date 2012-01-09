require 'rubygems'
require 'sinatra'
#require 'Link'

class Application < Sinatra::Base
	configure do
		ActiveRecord::Base.establish_connection(
				:adapter => 'sqlite3',
				:database => 'db/links.sqlite3'
				)
		set :static, true
	end
	
	get '/' do
		erb :index
	end
	
	post '/' do
		@link = Link.new :url => params[:url]
		if @link.save
			redirect "links/#{@link.key}"
		end
	end
	
	get '/links/:key' do
		@link = Link.find_by_key params[:key]
		erb :show
	end
	
	get '/*' do |key|
		@link = Link.find_by_key key
		if @link
			@link.increment_clicks
			redirect @link.url
		end
	end
end
