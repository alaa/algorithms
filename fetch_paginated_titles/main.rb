require 'net/http'
require 'json'

def fetch(title, page=1)
uri=URI("https://jsonmock.hackerrank.com/api/movies/search/?Title=#{title}&page=#{page}")

response = Net::HTTP.start(uri.host, uri.port,
                           :use_ssl => uri.scheme == 'https') do |http|
  request = Net::HTTP::Get.new uri
  http.request request # Net::HTTPResponse object
end
JSON.parse(response.body)
end

title = 'spiderman'
body = fetch(title)

(1..body['total_pages'].to_i).each do |p|
  body = fetch(title, p)
  body["data"].each do |x|
    p x["Title"]
  end
end
