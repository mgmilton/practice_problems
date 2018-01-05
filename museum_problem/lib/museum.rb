class Museum
  attr_reader :name
  attr_accessor :id

  def initialize(arguments)
    @id   = arguments[:id]
    @name = arguments[:name]
  end
end
