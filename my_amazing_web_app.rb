class MyAmazingWebApp

	@@headers = {
		"Content-Type" => "text/html",
		"My-Amazing-Header" => "coolbeans"
	}.freeze

	def call(env)
		case env["PATH_INFO"]
		when "/"
		[200, @@headers, ["Ok"]]
		else
		[404, @@headers, ["Page not found!"]]
		end
	end

end