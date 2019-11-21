require_relative('../db/sql_runner')
require_relative


class Casting

attr_accessor :movie_id, :star_id, :fee
attr_reader :id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @movie_id = details['movie_id'].to_i
    @star_id = details['star_id'].to_i
    @fee = details['fee']
  end

  def save()
    sql = "INSERT INTO castings
    (
      movie_id,
      star_id,
      fee
    )
    values
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@movie_id, @star_id, @fee]
    casting = SqlRunner.run(sql, values).first
    @id = casting['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM castings"
    castings = SqlRunner.run(sql)
    results = castings.map {|casting| Casting.new(casting)}
    return results
  end



  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

end
