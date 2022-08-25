# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "json"

Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
json = JSON.parse(URI.open(url).read)

json["results"].each do |result|
  Movie.create(
    title: result["title"],
    overview: result["overview"],
    poster_url: result["poster_path"],
    rating: result["vote_average"]
  )
end
