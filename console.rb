require_relative('models/movie.rb')
require_relative('models/star.rb')
# require_relative('models/casting.rb')

require('pry')

Movie.delete_all()
Star.delete_all()
# Casting.delete_all()

movie1 = Movie.new({ 'title' => 'Trainspotting', 'genre' => 'Drama' })
movie1.save()
movie2 = Movie.new({ 'title' => 'Star Wars Episode 1: The Phantom Menance', 'genre' => 'Garbage'})
movie2.save()
movie3 = Movie.new({ 'title' => 'Brave', 'genre' => 'Animated' })
movie3.save()

star1 = Star.new({ 'first_name' => 'Euan', 'last_name' => 'McGregor'})
star1.save()
star2 = Star.new({ 'first_name' => 'Kelly', 'last_name' => 'MacDonald'})
star2.save()

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 300000000})
casting1.save()
casting2 = Casting.new({'movie_id' => movie2.id, 'star_id' => star2.id, 'fee' => 150000000})
casting2.save()


binding.pry

nil
