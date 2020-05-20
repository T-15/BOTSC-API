module Auth0Helper
    require 'uri'
    require 'net/http'

    def get_token
        url = URI("https://botsc.auth0.com/oauth/token")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Post.new(url)
        request["content-type"] = 'application/json'
        request.body = "{\"client_id\":\"" + ENV["CLIENT_ID"] + "\",\"client_secret\":\"" + ENV["CLIENT_SECRET"] + "\",\"audience\":\"" + ENV["AUDIENCE"] + "\",\"grant_type\":\"" + ENV["GRANT_TYPE"] + "\"}"
        
        response = http.request(request)
        json = JSON.parse(response.body)
        return json["access_token"]
    end
end