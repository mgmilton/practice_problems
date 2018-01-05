class Photograph
  attr_reader :artist_id, :museum_id, :name, :year
  attr_accessor :id

  def initialize(data = {})
    @id = data[:id]
    @artist_id = data[:artist_id]
    @museum_id = data[:museum_id]
    @name = data[:name]
    @year = data[:year]
  end

end
