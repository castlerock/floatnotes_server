require "sinatra/base"
require "json"

autoload :Note, "models/note"

class FloatNotes < Sinatra::Base
  get '/' do
    "Hello World"
  end
  

  post "/notes.json" do
    p params
    note = Note.new(params)
    if note.save
      status("201")
      note.json
    end
  end

end


