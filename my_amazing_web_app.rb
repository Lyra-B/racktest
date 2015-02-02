class MyAmazingWebApp

	def headers(type)
	@@headers = {
		"Content-Type" => type, 
		"My-Amazing-Header" => "coolbeans"
	}.freeze
	end

	def call(env)
		case env["PATH_INFO"]
		when "/"
		[200, headers("text/html"), File.open("index.html")]
		when "/images/picture.jpeg"
		[200, headers("image/jpeg"), File.open("images/picture.jpeg")]
		else
		[404, @@headers, ["Page not found!"]]
		end
	end

end