class Star

  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @first_name = details['first_name']
    @last_name = details['last_name']
  end

  def save()
    sql = "INSERT INTO stars (first_name, last_name) VALUES ($1, $2) RETURNING id"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM stars"
    stars = SqlRunner.run(sql)
    return movies.map {|star| Star.new(movie)}
  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end
end
