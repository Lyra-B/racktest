class MyAmazingWebApp

	@@headers = {
		"Content-Type" => "text/html",
		"My-Amazing-Header" => "coolbeans"
	}.freeze

	def call(env)
		status_code = 200
		payload = ["<html><head><title>Hello world</title></head></html>"]
		[status_code, @@headers, payload]
	end

end