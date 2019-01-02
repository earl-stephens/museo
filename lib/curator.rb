require 'pry'

class Curator
  attr_reader :artists,
              :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_photographs_by_artist(artist)
    artist_id = artist.id
    # photo_array = []
    @photographs.find_all do |photograph|
      photograph.artist_id == artist_id
    end
  end

  def artists_with_multiple_photographs
    multiple_photos_artists = []
    @artists.each do |artist|
      temp_array = []
      @photographs.each do |photo|
        if photo.artist_id == artist.id
          temp_array << photo
        end
      end
      if temp_array.length > 1
        multiple_photos_artists << artist
      end
    end
    multiple_photos_artists
  end

  def sort_artists_by_country(country)
    @artists.find_all do |artist|
      artist.country == country
    end
  end

  def photographs_taken_by_artist_from(country)
    photo_array = []
    sort_artists_by_country(country).each do |artist|
      @photographs.each do |photo|
        if photo.artist_id == artist.id
          photo_array << photo
        end
      end
    end
    photo_array
  end

end
