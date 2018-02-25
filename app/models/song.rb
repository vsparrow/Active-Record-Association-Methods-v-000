class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    # self.artist = Artist.where("name == Drake")
    a = Artist.find_or_create_by( name: "Drake")
    STDERR.puts "************This is Artist.find_by::#{a}"
    # self.update artist: a
    self.artist = a
  end
end
