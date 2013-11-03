
class Calendar
	include HTTParty

	base_uri "https://www.googleapis.com/calendar/v3/calendars/" + ENV["CALENDAR_ID"]
	format :json

	def initialize
	end

	def get_upcoming_events
		# options = { timeMin: "2014-11-02T18:13:26-04:00" } 
		options = { timeMin: DateTime.now.to_s } 
		response = request(options)
		response["items"]
	end

	def imminent_event?
		upcoming_events = get_upcoming_events
		if upcoming_events.empty?
			return false
		else
			upcoming_events.each do |event|
				return true if is_event_imminent?(event)
			end
			return false
		end
	end

	def is_event_imminent? (event)
		fake_time = Time.parse("2013-11-05 10:31:00 -0500")
		start_time = Time.parse(event["start"]["dateTime"])
		start_time >= Time.now && start_time < 3.minutes.from_now
	end

	def request(options)
		params = { key: ENV["GOOGLE_API_KEY"] }
		params.merge! options
		self.class.get('/events', query: params)
	end
end