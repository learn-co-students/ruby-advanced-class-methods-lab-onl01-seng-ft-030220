class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.save
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    rett = FALSE
    Song.all.each do |song|
      if song.name == name then rett = song end
     end
  rett
 end
  
  def self.find_or_create_by_name(name)
    rett = FALSE
    rett = Song.find_by_name(name)
    if rett == FALSE then rett = Song.create_by_name(name) end
  rett
 end
 
 def self.alphabetical
   returnarray = []
   sortedarray = []
   @@all.each do |eachsong|
     sortedarray << eachsong.name
   end
   sortedarray = sortedarray.sort
   sortedarray.each do |eachsong|
     returnarray << Song.find_by_name(eachsong)
   end
   returnarray
 end
 
 def self.new_from_filename(filename)
   namearray = filename.split(" - ")
   artistname = namearray[0]
   name = namearray[1].chomp(".mp3")
   song = Song.new_by_name(name)
   song.artist_name = artistname
   song
 end
 
 def self.create_from_filename(filename)
   namearray = filename.split(" - ")
   artistname = namearray[0]
   name = namearray[1].chomp(".mp3")
   song = Song.find_or_create_by_name(name)
   song.artist_name = artistname
   song
 end
 
 def self.destroy_all
   @@all = []
 end
 
end

#song3 = Song.create

#song5 = Song.create_by_name("The Middle")
#song6 = Song.create_by_name("The End")
Song.destroy_all
song10 = Song.find_or_create_by_name("Alison")
song11 = Song.find_or_create_by_name("Alison")

#song12 = Song.new_from_filename("Taylor Swift - NewAlbum.mp3")

#Song.destroy_all
#puts song12.name
#puts song12.artist_name
puts song10
puts song11
#puts Song.find_by_name("BlankSpace")