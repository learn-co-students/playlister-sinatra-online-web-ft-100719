class Artist < ActiveRecord::Base 
    has_many :songs
    
    has_many :genres, through: :songs


    def slug
        #binding.pry
        self.name.gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        name = slug.gsub("-", " ").titleize
        Artist.all.find{|artist| artist.slug == slug}
        #binding.pry
    end

    
end