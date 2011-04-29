DB = Sequel.connect("mysql://root@localhost/floatnotes_#{ENV['RACK_ENV']}")

class Note < Sequel::Model
  def self.add_new_note(params)
    note = Note.new(params)
    note.save
  end
end

