class Record < WashOut::Type
  attr_accessor :id, :name

  type_name = 'record'
  map :record => {
        :name => :string,
        :id  => :int
      }
end