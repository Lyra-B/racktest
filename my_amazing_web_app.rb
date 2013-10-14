class MyAmazingWebApp

	@@headers = {
		"Content-Type" => "text/html",
		"My-Amazing-Header" => "coolbeans"
	}.freeze

	def call(env)
		# binding.pry
		case env['PATH_INFO']
		when '/index.html', '/'
			status_code = 200
			payload = File.open("index.html")
			[status_code, @@headers, payload]
		when '/coolbeans.html'
			status_code = 200
			payload = File.open("index.html").read
			payload.gsub!("X", "coolbeans")
			[status_code, @@headers, [payload]]
		when '/kitten.jpg'
			status_code = 200
			payload = File.open("kitten.jpg")
			[status_code, {"Content-Type" => 'image/jpeg'}, payload]
		else
			status_code = 404
			[status_code, {}, []]
		end
	end

end