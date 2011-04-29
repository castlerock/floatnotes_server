DB = Sequel.connect("mysql://root@localhost/floatnotes_#{ENV['RACK_ENV']}")

class Note < Sequel::Model
  def self.search_by_field(params = {})
    if params['url'] && !params['url'].empty?
      Note.find(:url => params['url'])
    elsif params['guid'] && !params['guid'].empty?
      Note.find(:guid => params['guid'])
    else
      Note.all
    end
  end
end

Note.plugin :json_serializer
