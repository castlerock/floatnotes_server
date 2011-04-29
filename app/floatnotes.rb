require "sinatra/base"
require "json"

class FloatNotes < Sinatra::Base
  get '/' do
    "Hello World"
  end
  
  get '/process.json' do
    content_type :json
    { :key => 'foo', :value => "bar"}.to_json
  end
end


