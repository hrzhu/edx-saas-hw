class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings
    @selected_ratings = @all_ratings if @selected_ratings.nil?
    if params[:sort_by].nil? and params[:ratings].nil?
      @movies = Movie.all
    else
      @sort_by = params[:sort_by]
      @ratings = params[:ratings]
      if params[:ratings].nil?
        ratings = Movie.all_ratings
      else
        ratings = @ratings.keys
      end
      @selected_ratings = ratings
      if @sort_by.nil?
        @movies = Movie.find_all_by_rating(ratings)
      else
        begin
          @movies = Movie.order("#{@sort_by} ASC").find_all_by_rating(ratings)
        rescue ActiveRecord::StatementInvalid
          flash[:warning] = "Movies cannot be sorted by this order"
          @movies = Movie.find_all_by_rating(ratings)
        end
      end
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
