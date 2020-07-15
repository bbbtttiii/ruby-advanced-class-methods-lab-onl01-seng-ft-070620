class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create         #class constructor "create"
    song = Song.new       #saves new instance of Song to variable "song"
    song.save             #performs .save method on song variable
    song                  #returns the song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.find{|x| x.name == title}
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by{|x| x.name}
  end

  def self.new_from_filename(file)                      #class constructor which takes in a filename (string)
    split_file = file.split(" - ")                      #new variable consisting of the filename string, split by dash
    artist_name = split_file[0]                         #first part of the string becomes the artist name
    song_name = split_file[1].chomp(".mp3")             #second part of the string becomes the song name + cut off .mp3 extension
    song = self.new                                     #
    song.name = song_name                               #
    song.artist_name = artist_name                      #
    song                                                #returns the song name
  end


  def self.create_from_filename(file)
    split_file = file.split(" - ")
    artist_name = split_file[0]
    song_name = split_file[1].chomp(".mp3")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end