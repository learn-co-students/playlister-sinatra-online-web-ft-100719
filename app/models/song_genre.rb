class SongGenre < ActiveRecord::Base
  belongs_to :song, foreign_key: "song_id"
  belongs_to :genre, foreign_key: "genre_id"
end
