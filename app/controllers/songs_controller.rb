require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if @song
      erb :'songs/show'
    else
      redirect '/songs'
    end
  end
  
  post '/songs' do
    artist = Artist.find_by(name: params[:artist_name])
    song = Song.new(params[:song])
    artist = Artist.new(name: params[:artist_name]) if artist.nil?
    artist.save
    song.artist = artist
    song.genres = Genre.where(id: params[:genres].map(&:to_i))
    if song.save
      flash[:message] = "Successfully created song."
      redirect "/songs/#{song.slug}"
    else
      redirect '/songs/new'
    end
  end


  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    if @song
      erb :'songs/edit'
    else
      redirect '/songs'
    end
  end

  patch '/songs/:slug/edit' do
    song = Song.find_by_slug(params[:slug])
    artist = Artist.find_by(name: params[:artist_name])
    artist = Artist.new(name: params[:artist_name]) if artist.nil?
    artist.save
    song.artist = artist
    song.genres = Genre.where(id: params[:genres].map(&:to_i))
    if song.save
      flash[:message] = "Successfully updated song."
      redirect "/songs/#{song.slug}"
    else
      redirect "/songs/#{song.slug}/edit"
    end
  end

end
