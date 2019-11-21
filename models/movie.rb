require_relative('../db/sql_runner')

class Movie

 attr_accessor :title, :genre
 attr_reader :id

 def initialize(details)
   @id = details['id'].to_i() if details['id']
   @title = details['title']
   @genre = details['genre']
 end

 def save()
   sql = "INSERT INTO movies (title, genre) VALUES ($1, $2) RETURNING id"
   values = [@title, @genre]
   result = SqlRunner.run(sql, values)
   @id = result[0]['id'].to_i()
 end

 def self.all()
   sql = "SELECT * FROM movies"
   movies = SqlRunner.run(sql)
   return movies.map {|movie| Movie.new(movie)}
 end

 def self.delete_all()
   sql = "DELETE FROM movies"
   SqlRunner.run(sql)
 end
end
