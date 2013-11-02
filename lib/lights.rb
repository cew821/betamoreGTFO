class Lights
 	
 	def initialize
 		@client = Hue::Client.new(ENV["HUE_USERNAME"])
 	end

 	def turn_on
 		lights.each do |light|
 			light.on = true
 			light.hue = 40000
 		end
	end

	def turn_off
		lights.each { |light| light.on = false }
	end

	def set_all(transition = 30, attrs = {} )
		puts "setting lights to #{attrs}"
		lights.each do |light|
			light.set_state attrs, transition
		end
	end

	def warn
		3.times do
			set_all 20, {hue: 0, saturation: 255 }
			sleep 2
			set_all 20, {hue: 40000, saturation: 0 }
			sleep 2
		end
		restore_defaults
	end

	def party
		30.times do
			hue = rand 65535
			set_all 0, {hue: hue, saturation: 255 }
		end
		restore_defaults
	end

	def restore_defaults
		set_all 30, {hue: 40000, saturation: 0 }
	end

	def lights
		@client.lights
	end
end