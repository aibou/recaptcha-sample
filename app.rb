require 'sinatra'
require 'net/http'
require 'uri'
require 'json'

get '/' do
  haml :index
end

post '/send' do
  
  res = Net::HTTP.post_form URI.parse('https://www.google.com/recaptcha/api/siteverify'), {secret: '6LflewQTAAAAAIZR9OMCOm5O6MkMTzCeJ-1VoqOU', response: params['g-recaptcha-response'], remoteip: request.ip}
  body = JSON.parse res.body
  @result = body['success']
  haml :send
end
