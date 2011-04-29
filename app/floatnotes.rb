require "sinatra/base"
require "json"
require "sequel"

$:<< File.dirname(__FILE__)

autoload :Note, "models/note"

class FloatNotes < Sinatra::Base
  configure(:development) do
    enable :logging
  end

  configure :test do
    disable :show_exceptions
  end

  get '/' do
    "Hello World"
  end
  

  post "/notes.json" do
    note = Note.new(params)
    if note.save
      status("201")
      note.to_json
    else
      status("422")
    end
  end

  get "/notes.json" do
    notes = Note.all
    notes.to_json
  end

end


