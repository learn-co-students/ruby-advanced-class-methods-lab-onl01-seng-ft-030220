class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    # nil returns false
    song ? song : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    song = self.new
    file = file.split(' - ')

    song.artist_name = file[0]
    song.name = file[1].delete_suffix('.mp3')

    song
  end

  def self.create_from_filename(file)
    song = self.new
    file = file.split(' - ')

    song.artist_name = file[0]
    song.name = file[1].delete_suffix('.mp3')

    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
