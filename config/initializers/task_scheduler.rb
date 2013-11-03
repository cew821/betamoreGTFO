require 'rufus/scheduler'
scheduler = Rufus::Scheduler.new

scheduler.every '1m' do
	puts "Checking for imminent events..."
	EventCheck.check_for_warning
end