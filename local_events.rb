require "pry"
require "net/http"
require "json"

if ARGV.length > 3
  date = ARGV.pop
  state = ARGV.pop
  city = ARGV.join("+")
  ARGV = [city, state, date]
end

uri = URI("http://api.seatgeek.com/2/events?venue.city=#{ARGV[0]}&venue.state=#{ARGV[1]}&datetime_local.lte=#{ARGV[2]}")
response = Net::HTTP.get_response(uri)

events = JSON.parse(response.body)["events"]
events.each do |event|
  puts "#{event["title"]} @ #{event["venue"]["name"]}"
end
