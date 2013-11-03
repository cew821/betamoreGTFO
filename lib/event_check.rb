
class EventCheck
	def self.check_for_warning
		cal = Calendar.new
		if cal.imminent_event?
			issue_warning
			return true
		end
		puts "no imminent events found"
		false
	end

	def self.issue_warning
		puts "Warning occupents of upcoming event!"
		lights = Lights.new
		lights.warn
	end
end