class Artist
  attr_reader :name,
              :born,
              :died,
              :country

  attr_accessor :id

  def initialize(arguments)
    @id      = arguments[:id]
    @name    = arguments[:name]
    @born    = arguments[:born]
    @died    = arguments[:died]
    @country = arguments[:country]
  end
end
