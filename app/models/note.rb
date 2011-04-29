class Note < Sequel::Model
  def self.add_new_note(params)
    note = Note.new(params)
    note.save
  end
end

