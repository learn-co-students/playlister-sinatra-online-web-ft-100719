class Genre < ActiveRecord::Base 
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs


    def slug
        #binding.pry
        self.name.gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        name = slug.gsub("-", " ").titleize
        self.all.find{|genre| genre.slug == slug}
        #binding.pry
    end

end