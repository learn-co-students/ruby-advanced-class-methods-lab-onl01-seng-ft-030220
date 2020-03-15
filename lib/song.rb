class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = Song.new 
    song.save 
    song 
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end 
  
  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name 
    @@all<< song
    song
  end 
  
  def self.find_by_name(name)
    @@all.find do |x| x.name==(name)
  end 
  end 
  
  def self.find_or_create_by_name(name) 
    song = find_by_name(name)
    if song == nil
      create_by_name(name)
    else
      return song
    end
  end
  
  def self.alphabetical
  @@all.sort_by do |song| song.name
    end 
  end
  
  def self.new_from_filename(file)
    song = Song.new 
    file_name = file.split(" - ")
    song.artist_name = file_name[0]
    song.name = file_name[1].delete_suffix(".mp3")
    song
  end

def self.create_from_filename(file)
    song = Song.new 
    file_name = file.split(" - ")
    song.artist_name = file_name[0]
    song.name = file_name[1].delete_suffix(".mp3")
    @@all<< song
    song
end 

def self.destroy_all
  @@all.clear
end

end 