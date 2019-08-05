require 'uri'
require 'net/http'
require 'json'

# create a new variable called URL which is at a valid endpoint
url = URI("http://api.noopschallenge.com/hexbot?count=10")

# set up a new net http instance
http = Net::HTTP.new(url.host, url.port)

# prepare net http request
request = Net::HTTP::Get.new(url)

# get the responce from the http instance passing in our request details
response = http.request(request)

# output result
p "api response"
puts response.read_body
# {"colors":[{"value":"#8FF012"}]}

# convert hson string to ruby hash
colours = JSON.parse(response.read_body)

p "json parse"
puts colours["colors"][0]["value"]

#loop through colours array
colour_array = colours["colors"]
colour_array.each do |c|
  p c["value"]
end
