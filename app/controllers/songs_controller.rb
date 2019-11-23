require 'rack-flash'
class SongsController < ApplicationController
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        #binding.pry
        erb :'songs/index'
    end

    get '/songs/new' do
        #binding.pry
        erb :'songs/new'
    end

    post '/songs' do 
        #binding.pry
        @song = Song.create(name: params["song_name"])
        @song.artist = Artist.find_or_create_by(name: params["artist_name"])
        params[:genres].each do |t|
            @song.genres << Genre.find_or_create_by(name: t)
        end
        @song.save
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{@song.slug}"
        #binding.pry
    end

    get '/songs/:slug/edit' do #:slug = :id
        #binding.pry
        @song = Song.find_by_slug(params[:slug])
        @genre = @song.genres.name
        erb :'songs/edit' 
    end

    get '/songs/:slug' do  #:slug = :id
        @song = Song.find_by_slug(params[:slug])
        @artist = @song.artist
        @genre = @song.genres
        #binding.pry
        erb :'songs/show'
    end

    patch '/songs/:slug' do #:slug = :id
        
        @song = Song.find_by_slug(params[:slug])

        @song.update(name: params["song_name"] )
        @song.artist = Artist.find_or_create_by(name: params["artist_name"]) 
        
        #@song.genres = Genre.find_or_create_by(id: params["ids"]) 
        
        #params[:genres].map do |t|
            #binding.pry
            #@song.genres << Genre.find_or_create_by(id: t)
        #end
        @song.save
        flash[:message] = "Successfully updated song."
        redirect to "/songs/#{@song.slug}"
    end 
end