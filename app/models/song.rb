class Song < ActiveRecord::Base

  belongs_to :artist, class_name: "Artist", foreign_key: "artist_id"
  has_many :song_genres
  has_many :genres, through: :song_genres

  extend Concerns::Slugifiable::ClassMethods
  include Concerns::Slugifiable::InstanceMethods
end
