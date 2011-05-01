Sequel.migration do 
  up do
    create_table(:notes) do
      primary_key :id
      String :url, :text => true
      String :protocol, :text => true
      String :content, :text => true
      String :color
      String :guid
      Time :creation_date
      Time :modification_date
      
      Fixnum :x
      Fixnum :y
      Fixnum :w
      Fixnum :h
      Fixnum :status
    end
  end

  down do
    drop_table(:notes)
  end
end
