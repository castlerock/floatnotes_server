require File.expand_path("../test_helper", __FILE__)

class FloatNotesTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    FloatNotes
  end
  
  context "Creating new notes with valid values" do
    should "save note" do
      post "/notes.json", note_params
      p last_response.body
      p last_response.status
    end
  end

  def note_params
    { 
      :url => "http://www.google.com",
      :protocol => "http",
      :content => "All that is gold does not glitter",
      :h => 40,
      :w => 200,
      :x => 40,
      :y => 100,
      :status => "1",
      :color => "yellow",
      :guid => "barbar"
    }
  end
end

