class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        erb :'songs/new'
    end

    post '/songs' do 
        #binding.pry
        @song = Song.create(name: params["song_name"])
        @song.artist = Artist.create(name: params["artist_name"])
        
        #array = params[:genres]
        #array.each do |t|
            #if t.empty?
               # t.delete
            #elsif t
                #t.genre = Genre.create(name: params["genres"])
            #end
            #binding.pry
        #end
        #@song.genre = Genre.create(name: params["genres"])
        
        #if  !params["genres"].empty? 
            #@song.genre << Genre.create(name: #params["genres_name"])
        #end 
        @song.save
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do #:slug = :id
        erb :'songs/edit' 
    end

    get '/songs/:slug' do  #:slug = :id
        #@song = Song.find(params[:id]
        erb :'songs/show'
    end

    patch '/songs/:slug' do #:slug = :id
    end 



end