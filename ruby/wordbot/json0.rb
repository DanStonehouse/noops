require 'uri'
require 'net/http'
require 'json'

# create a new variable called URL which is at a valid endpoint
url = URI("http://api.noopschallenge.com/wordbot?count=5&set=animals")

# set up a new net http instance
http = Net::HTTP.new(url.host, url.port)

# prepare net http request
request = Net::HTTP::Get.new(url)

# get the responce from the http instance passing in our request details
response = http.request(request)

# output result
p "api response"
puts response.read_body
# {"words":[{"value":"#8FF012"}]}

# convert hson string to ruby hash
word = JSON.parse(response.read_body)

p "json parse"
puts word["words"][0]["value"]

#loop through words array
words_array = word["words"]
words_array.each do |word|
  p word
end
