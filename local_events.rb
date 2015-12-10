require "pry"
require "net/http"
require "json"

today = Time.now.strftime("%Y-%m-%d")

if ARGV.length > 2
  last = ARGV.pop
  first = ARGV.join("+")
  ARGV = [first, last]
end

uri = URI("http://api.seatgeek.com/2/events?venue.city=#{ARGV[0]}&venue.state=#{ARGV[1]}")
response = Net::HTTP.get_response(uri)

events = JSON.parse(response.body)["events"]
events.each do |event|
  puts "#{event["title"]} @ #{event["venue"]["name"]}"
end
