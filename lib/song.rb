class Song
  attr_accessor :name, :artist_name, :song_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


	def self.create
		song = Song.new
		song.save
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
		self.all.detect {|song| song.name == song_name}
	end

	def self.find_or_create_by_name(song_name)
		self.find_by_name(song_name) || self.create_by_name(song_name)
	end
	def self.alphabetical
		self.all.sort_by{|song| song.name}
	end


	def self.new_from_filename(filename)
		song = self.new
		file_name = filename.delete_suffix('.mp3').split(' - ') 
		song.artist_name = file_name[0] 
		song.name = file_name[1]
		
		song
end

	def self.create_from_filename(filename)
		song = self.new
		file_name = filename.delete_suffix('.mp3').split(' - ') 
		song.artist_name = file_name[0]
		song.name = file_name[1]
	self.all << song
end





 	def self.destroy_all
 		@@all.map {|all| @@all = [] }
 	end




end
