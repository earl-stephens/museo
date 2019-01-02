require 'minitest/autorun'
require 'minitest/pride'
require './lib/artist'
require './lib/photograph'
require './lib/curator'

class CuratorTest < Minitest::Test

def test_it_exists
  curator = Curator.new

  assert_instance_of Curator, curator
end

def test_it_starts_with_no_artists_or_photographs
  curator = Curator.new

  assert_equal [], curator.artists
  assert_equal [], curator.photographs
end

def test_it_can_add_photographs
  curator = Curator.new
  photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }
  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }

  photo_1 = Photograph.new(photo_1)
  photo_2 = Photograph.new(photo_2)

  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  assert_equal [photo_1, photo_2], curator.photographs
end

def test_it_can_get_the_first_photo
  curator = Curator.new
  photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }
  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }
  photo_1 = Photograph.new(photo_1)
  photo_2 = Photograph.new(photo_2)

  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)

  assert_equal photo_1, curator.photographs.first
end

def test_it_can_get_the_first_photos_name
  curator = Curator.new
  photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }
  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }
  photo_1 = Photograph.new(photo_1)
  photo_2 = Photograph.new(photo_2)

  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)

  assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", curator.photographs.first.name
end

def test_it_can_add_artists
  curator = Curator.new
  artist_1 = {
  id: "1",
  name: "Henri Cartier-Bresson",
  born: "1908",
  died: "2004",
  country: "France"
  }
  artist_2 = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }
  artist_1 = Artist.new(artist_1)
  artist_2 = Artist.new(artist_2)

  curator.add_artist(artist_1)
  curator.add_artist(artist_2)

  assert_equal [artist_1, artist_2], curator.artists
end

def test_it_can_find_artist_by_id
  curator = Curator.new
  photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }
  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }
  photo_3 = {
  id: "3",
  name: "Identical Twins, Roselle, New Jersey",
  artist_id: "3",
  year: "1967"
  }
  photo_4 = {
  id: "4",
  name: "Child with Toy Hand Grenade in Central Park",
  artist_id: "3",
  year: "1962"
  }
  artist_1 = {
  id: "1",
  name: "Henri Cartier-Bresson",
  born: "1908",
  died: "2004",
  country: "France"
  }
  artist_2 = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }
  artist_3 = {
  id: "3",
  name: "Diane Arbus",
  born: "1923",
  died: "1971",
  country: "United States"
  }
  photo_1 = Photograph.new(photo_1)
  photo_2 = Photograph.new(photo_2)
  photo_3 = Photograph.new(photo_3)
  photo_4 = Photograph.new(photo_4)
  artist_1 = Artist.new(artist_1)
  artist_2 = Artist.new(artist_2)
  artist_3 = Artist.new(artist_3)

  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  curator.add_photograph(photo_3)
  curator.add_photograph(photo_4)
  curator.add_artist(artist_1)
  curator.add_artist(artist_2)
  curator.add_artist(artist_3)

  assert_equal artist_3, curator.find_artist_by_id("3")
end

def test_it_can_find_photographs_by_artist
  curator = Curator.new
  photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }
  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }
  photo_3 = {
  id: "3",
  name: "Identical Twins, Roselle, New Jersey",
  artist_id: "3",
  year: "1967"
  }
  photo_4 = {
  id: "4",
  name: "Child with Toy Hand Grenade in Central Park",
  artist_id: "3",
  year: "1962"
  }
  artist_1 = {
  id: "1",
  name: "Henri Cartier-Bresson",
  born: "1908",
  died: "2004",
  country: "France"
  }
  artist_2 = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }
  artist_3 = {
  id: "3",
  name: "Diane Arbus",
  born: "1923",
  died: "1971",
  country: "United States"
  }
  photo_1 = Photograph.new(photo_1)
  photo_2 = Photograph.new(photo_2)
  photo_3 = Photograph.new(photo_3)
  photo_4 = Photograph.new(photo_4)
  artist_1 = Artist.new(artist_1)
  artist_2 = Artist.new(artist_2)
  artist_3 = Artist.new(artist_3)

  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  curator.add_photograph(photo_3)
  curator.add_photograph(photo_4)
  curator.add_artist(artist_1)
  curator.add_artist(artist_2)
  curator.add_artist(artist_3)

  assert_equal [photo_3, photo_4], curator.find_photographs_by_artist(artist_3)
end

def test_it_can_find_artists_with_multiple_photographs
  curator = Curator.new
  photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }
  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }
  photo_3 = {
  id: "3",
  name: "Identical Twins, Roselle, New Jersey",
  artist_id: "3",
  year: "1967"
  }
  photo_4 = {
  id: "4",
  name: "Child with Toy Hand Grenade in Central Park",
  artist_id: "3",
  year: "1962"
  }
  artist_1 = {
  id: "1",
  name: "Henri Cartier-Bresson",
  born: "1908",
  died: "2004",
  country: "France"
  }
  artist_2 = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }
  artist_3 = {
  id: "3",
  name: "Diane Arbus",
  born: "1923",
  died: "1971",
  country: "United States"
  }
  photo_1 = Photograph.new(photo_1)
  photo_2 = Photograph.new(photo_2)
  photo_3 = Photograph.new(photo_3)
  photo_4 = Photograph.new(photo_4)
  artist_1 = Artist.new(artist_1)
  artist_2 = Artist.new(artist_2)
  artist_3 = Artist.new(artist_3)

  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  curator.add_photograph(photo_3)
  curator.add_photograph(photo_4)
  curator.add_artist(artist_1)
  curator.add_artist(artist_2)
  curator.add_artist(artist_3)

  assert_equal [artist_3], curator.artists_with_multiple_photographs
end

def test_for_number_of_artists_with_multiple_photographs
  curator = Curator.new
  photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }
  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }
  photo_3 = {
  id: "3",
  name: "Identical Twins, Roselle, New Jersey",
  artist_id: "3",
  year: "1967"
  }
  photo_4 = {
  id: "4",
  name: "Child with Toy Hand Grenade in Central Park",
  artist_id: "3",
  year: "1962"
  }
  artist_1 = {
  id: "1",
  name: "Henri Cartier-Bresson",
  born: "1908",
  died: "2004",
  country: "France"
  }
  artist_2 = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }
  artist_3 = {
  id: "3",
  name: "Diane Arbus",
  born: "1923",
  died: "1971",
  country: "United States"
  }
  photo_1 = Photograph.new(photo_1)
  photo_2 = Photograph.new(photo_2)
  photo_3 = Photograph.new(photo_3)
  photo_4 = Photograph.new(photo_4)
  artist_1 = Artist.new(artist_1)
  artist_2 = Artist.new(artist_2)
  artist_3 = Artist.new(artist_3)

  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  curator.add_photograph(photo_3)
  curator.add_photograph(photo_4)
  curator.add_artist(artist_1)
  curator.add_artist(artist_2)
  curator.add_artist(artist_3)

  assert_equal 1, curator.artists_with_multiple_photographs.length
end

def test_it_can_validate_the_artist_with_multiple_photographs
  curator = Curator.new
  photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }
  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }
  photo_3 = {
  id: "3",
  name: "Identical Twins, Roselle, New Jersey",
  artist_id: "3",
  year: "1967"
  }
  photo_4 = {
  id: "4",
  name: "Child with Toy Hand Grenade in Central Park",
  artist_id: "3",
  year: "1962"
  }
  artist_1 = {
  id: "1",
  name: "Henri Cartier-Bresson",
  born: "1908",
  died: "2004",
  country: "France"
  }
  artist_2 = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }
  artist_3 = {
  id: "3",
  name: "Diane Arbus",
  born: "1923",
  died: "1971",
  country: "United States"
  }
  photo_1 = Photograph.new(photo_1)
  photo_2 = Photograph.new(photo_2)
  photo_3 = Photograph.new(photo_3)
  photo_4 = Photograph.new(photo_4)
  artist_1 = Artist.new(artist_1)
  artist_2 = Artist.new(artist_2)
  artist_3 = Artist.new(artist_3)

  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  curator.add_photograph(photo_3)
  curator.add_photograph(photo_4)
  curator.add_artist(artist_1)
  curator.add_artist(artist_2)
  curator.add_artist(artist_3)

  assert_equal artist_3, curator.artists_with_multiple_photographs.first
end

def test_it_can_find_photos_from_artists_of_a_specific_country
  # skip
  curator = Curator.new
  photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }
  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }
  photo_3 = {
  id: "3",
  name: "Identical Twins, Roselle, New Jersey",
  artist_id: "3",
  year: "1967"
  }
  photo_4 = {
  id: "4",
  name: "Child with Toy Hand Grenade in Central Park",
  artist_id: "3",
  year: "1962"
  }
  artist_1 = {
  id: "1",
  name: "Henri Cartier-Bresson",
  born: "1908",
  died: "2004",
  country: "France"
  }
  artist_2 = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }
  artist_3 = {
  id: "3",
  name: "Diane Arbus",
  born: "1923",
  died: "1971",
  country: "United States"
  }
  photo_1 = Photograph.new(photo_1)
  photo_2 = Photograph.new(photo_2)
  photo_3 = Photograph.new(photo_3)
  photo_4 = Photograph.new(photo_4)
  artist_1 = Artist.new(artist_1)
  artist_2 = Artist.new(artist_2)
  artist_3 = Artist.new(artist_3)

  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  curator.add_photograph(photo_3)
  curator.add_photograph(photo_4)
  curator.add_artist(artist_1)
  curator.add_artist(artist_2)
  curator.add_artist(artist_3)

  assert_equal [photo_2, photo_3, photo_4], curator.photographs_taken_by_artist_from("United States")
end

def test_it_can_sort_artists_by_country
  curator = Curator.new
  photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }
  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }
  photo_3 = {
  id: "3",
  name: "Identical Twins, Roselle, New Jersey",
  artist_id: "3",
  year: "1967"
  }
  photo_4 = {
  id: "4",
  name: "Child with Toy Hand Grenade in Central Park",
  artist_id: "3",
  year: "1962"
  }
  artist_1 = {
  id: "1",
  name: "Henri Cartier-Bresson",
  born: "1908",
  died: "2004",
  country: "France"
  }
  artist_2 = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }
  artist_3 = {
  id: "3",
  name: "Diane Arbus",
  born: "1923",
  died: "1971",
  country: "United States"
  }
  photo_1 = Photograph.new(photo_1)
  photo_2 = Photograph.new(photo_2)
  photo_3 = Photograph.new(photo_3)
  photo_4 = Photograph.new(photo_4)
  artist_1 = Artist.new(artist_1)
  artist_2 = Artist.new(artist_2)
  artist_3 = Artist.new(artist_3)

  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  curator.add_photograph(photo_3)
  curator.add_photograph(photo_4)
  curator.add_artist(artist_1)
  curator.add_artist(artist_2)
  curator.add_artist(artist_3)

  assert_equal [artist_2, artist_3], curator.sort_artists_by_country("United States")
end

def test_it_can_reject_a_country_that_no_photographer_is_from
  curator = Curator.new
  photo_1 = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "1",
  year: "1954"
  }
  photo_2 = {
  id: "2",
  name: "Moonrise, Hernandez",
  artist_id: "2",
  year: "1941"
  }
  photo_3 = {
  id: "3",
  name: "Identical Twins, Roselle, New Jersey",
  artist_id: "3",
  year: "1967"
  }
  photo_4 = {
  id: "4",
  name: "Child with Toy Hand Grenade in Central Park",
  artist_id: "3",
  year: "1962"
  }
  artist_1 = {
  id: "1",
  name: "Henri Cartier-Bresson",
  born: "1908",
  died: "2004",
  country: "France"
  }
  artist_2 = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }
  artist_3 = {
  id: "3",
  name: "Diane Arbus",
  born: "1923",
  died: "1971",
  country: "United States"
  }
  photo_1 = Photograph.new(photo_1)
  photo_2 = Photograph.new(photo_2)
  photo_3 = Photograph.new(photo_3)
  photo_4 = Photograph.new(photo_4)
  artist_1 = Artist.new(artist_1)
  artist_2 = Artist.new(artist_2)
  artist_3 = Artist.new(artist_3)

  curator.add_photograph(photo_1)
  curator.add_photograph(photo_2)
  curator.add_photograph(photo_3)
  curator.add_photograph(photo_4)
  curator.add_artist(artist_1)
  curator.add_artist(artist_2)
  curator.add_artist(artist_3)

  assert_equal [], curator.photographs_taken_by_artist_from("Argentina")
end

end
