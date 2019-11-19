class Genre < ActiveRecord::Base
    #has associations in ORDER!! Can't associate artists through songs until songs are associated!!
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
end