
class BitlyServer

	def urls
		@urls ||= {}
	end

	def add_url(url)
		arr = [rand(10), rand(10), rand(10)]
		rand_url = arr.join
		urls[rand_url] = url
		rand_url
	end

	def call(env)

		target = env["PATH_INFO"].slice(1, env["PATH_INFO"].length)
		if urls.include? target
			[302, {"Location" => urls[target]}, '']
		elsif env["PATH_INFO"] == '/'
			[200, {}, '']
		elsif env["QUERY_STRING"] != ''
			str = env["QUERY_STRING"].gsub(/url=http%3A%2F%2F/, 'http://')

			[200, {}, add_url(str)]
		else
			[404, {}, 'Page not found!']
		end
	end
end