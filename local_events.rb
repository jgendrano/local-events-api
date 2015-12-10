require "pry"
require "net/http"
require "json"

city = "Boston"
state = "MA"
today = Time.now.strftime("%Y-%m-%d")

uri = URI("http://api.seatgeek.com/2/events?venue.city=#{city}&venue.state=#{state}")
response = Net::HTTP.get_response(uri)

events = JSON.parse(response.body)["events"]
events.each do |event|
  puts "#{event["title"]} @ #{event["venue"]["name"]}"
end
