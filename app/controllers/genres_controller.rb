class GenresController < ApplicationController
    get '/genres' do 
        #binding.pry
        @genres = Genre.all
        erb :'genres/index'
    end

    get '/genres/:slug' do #:slug = :id
        @genre = Genre.find_by_slug(params[:slug])
        @artist = @genre.artists
        #binding.pry
        erb :'genres/show'
    end
end