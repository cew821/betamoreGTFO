class Lights
 	def self.turn_on
 		self.lights.each { |light| light.on = true }
	end

	def self.turn_off
		self.lights.each { |light| light.on = false }
	end

	def self.lights
		client = Hue::Client.new(ENV["HUE_USERNAME"])
		client.lights
	end
end