class BitlyServer

	def urls
		@urls ||= {}
	end

	def add_url(url)
	end

	def call(env)
		[500, {}, 'TODO- make this work']
	end
end