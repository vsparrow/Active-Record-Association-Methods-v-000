class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
    self.songs.first.genre
  end

  def song_count
    #return the number of songs associated with the artist
    self.songs.count
  end

  def genre_count
    # count = 0
    # self.songs do |s|
    #   count+= s.genre.count
    # end
    # count
    #return the number of genres associated with the artist
    genres = []
    self.songs.each do |s|
      genres << s.genre
      # STDERR.puts "****************#{s}"
    end
    # STDERR.puts "**************************artist.rb:genre_count::#{genres}"
    genres.uniq.size
  end
end
