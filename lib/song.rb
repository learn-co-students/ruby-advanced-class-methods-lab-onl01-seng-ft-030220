class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name
    @@all << song
    song
  end
  
  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.new_from_filename(file_name)
    seperate_by_dash = file_name.split(" - ")
    name = seperate_by_dash[1].split(".mp3").join("")
    song = Song.new 
    song.name = name
    artist = seperate_by_dash[0]
    song.artist_name = artist
    song
  end
  
  def self.create_from_filename(file_name)
    @@all << self.new_from_filename(file_name)
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.alphabetical
    @@all.sort {|song1, song2| song1.name <=> song2.name}
  end
  
end
