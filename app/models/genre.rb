class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.count
  end

  def artist_count
    # return the number of artists associated with the genre
    # Artist.count("Songs.genre == ?", self)
    artists = []
    self.songs.each do |s|
      artists << s.artist
    end
    artists.uniq.size
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    all_artists=[]
    self.songs.each { |s| all_artists << s.artist.name }
    all_artists
  end
end
