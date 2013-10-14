class MyAmazingWebApp

	@@headers = {
		"Content-Type" => "text/html",
		"My-Amazing-Header" => "coolbeans"
	}.freeze

	def call(env)
		[500, @@headers, ["TODO - make a webapp"]]
	end

end