require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :location, Text
  property :description, Text
  property :price, Integer

end
