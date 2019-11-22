class Song < ActiveRecord::Base 
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    
    def slug
        self.name.gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        name = slug.gsub("-", " ").titleize
        self.all.find{|song| song.slug == slug}
        #binding.pry
    end
 end