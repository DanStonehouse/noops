require 'uri'
require 'net/http'

# create a new variable called URL which is at a valid endpoint
url = URI("http://api.noopschallenge.com/hexbot")

# set up a new net http instance
http = Net::HTTP.new(url.host, url.port)

# prepare net http request
request = Net::HTTP::Get.new(url)

# get the responce from the http instance passing in our request details
response = http.request(request)

# output result 
puts response.read_body
# {"colors":[{"value":"#8FF012"}]}
