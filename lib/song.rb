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
    
    song=self.new
    @@all <<song
    song
  end
    
    
  def self.new_by_name(song_name)
    song=self.new
    song.name=song_name
    song
    
  end
  
  def self.create_by_name(song_name)
    song=self.new
    song.name=song_name
    self.all<<song
    song
  end 
  
  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name==song_name
    end
    
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
     
  end
  
  def self.alphabetical
    @@all.sort_by do |a|
      a.name
    end 
  end 
  
  
  def self.new_from_filename(name)
    @arr1=name.split(" - ")
    @arr2=@arr1[1].split(".")
    @singer_name=@arr1[0]
    @song_name=@arr2[0]

    song=self.new
    song.name=@song_name
    song.artist_name=@singer_name
    
    song
    
    
  end
  
  def self.create_from_filename(file_name)
    self.all<<self.new_from_filename(file_name)
    
  end 
    
  
  def self.destroy_all
  
    @@all.clear
  end
    

    
    
  

    
    
  
  
end

