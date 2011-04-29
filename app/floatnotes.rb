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
    notes_params = JSON.parse(request.body.string)
    note = Note.new(notes_params)
    if note.save
      status("201")
      note.to_json
    else
      status("422")
    end
  end

  get "/notes.json" do
    notes = Note.search_by_field(params) || []
    notes.to_json
  end

  delete '/notes/:id.json' do |note_id|
    note = Note.find(:id => note_id)
    if note && note.delete
      status("200")
    else
      status("422")
    end
  end

  put '/notes/:id.json' do
    p body
    note = Note.find(:id => params[:id])
    notes_params = JSON.parse(request.body.string)
    note.set(notes_params)
    if note.save
      status(200)
      note.to_json
    else
      status(422)
    end
  end

  get "/urls.json" do
    urls = Note.distinct(:url).select(:url)
    urls.to_json
  end

  get '/guids.json' do
    guids = Note.distinct(:guid).select(:guid)
    guids.to_json
  end
end


