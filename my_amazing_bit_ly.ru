require 'rack'
require 'pry'

class MyAmazingBitLy
	@@db = {
		'/xyz' => 'http://wegotcoders.com'
	}

	def call(env)
		url = @@db[env['REQUEST_PATH']]
		if url
			[302, { "Location" => url }, []]
		else
			[404, { "Content-Type" => "text/html" }	, ["File not found"]]
		end
	end

end

run MyAmazingBitLy.new