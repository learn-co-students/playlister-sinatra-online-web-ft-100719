class SongGenre < ActiveRecord::Base 
    belongs_to :song 
    belongs_to :genre 

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