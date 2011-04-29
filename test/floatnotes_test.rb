require File.expand_path("../test_helper", __FILE__)

class FloatNotesTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    FloatNotes
  end
  
  context "Creating new notes with valid values" do
    should "save note" do
      post "/notes.json", note_params.to_json
      note = Note.find(:url => "http://www.google.com")
      assert note
      assert_status(201)

      delete "/notes/#{note.id}.json"
      assert_status(200)
    end

    should "have all the notes" do
      get "/notes.json"
      assert_status(200)
    end

    should "be able to search note by guid" do
      note = Note.create(note_params.merge(:guid => "helloworld"))
      get "/notes.json?guid=helloworld"
      assert_status(200)
      t = json_response
      assert t.h
      assert_equal 40, t.h
    end

    should "return empty list of no note by guid is found" do
      get "/notes.json?guid=helloworld"
      assert_status(200)
      t = json_response
      assert t.empty?
    end

    should "be able to search note by url" do
      note = Note.create(note_params.merge(:url => "helloworld"))
      get "/notes.json?url=helloworld"
      assert_status(200)
      t = json_response
      assert t.h
      assert_equal 40, t.h
    end

    should "be able to get urls" do
      Note.create(note_params.merge(:url => "helloworld"))
      Note.create(note_params.merge(:url => "wow"))

      get "/urls.json"
      assert_status(200)
      t = json_response
      assert t
    end

    should "be able to update note" do
      note = Note.create(note_params.merge(:url => "helloworld"))
      put "/notes/#{note.id}.json", note_params.merge(:content => "world_sucks").to_json

      assert_status(200)
      t = json_response
      assert t
      assert_equal 'world_sucks', t.content
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

