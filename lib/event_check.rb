
class EventCheck
	def self.check_for_warning
		cal = Calendar.new
		if cal.imminent_event?
			issue_warning
			return true
		end
		false
	end

	def self.issue_warning
		lights = Lights.new
		lights.warn
	end
end