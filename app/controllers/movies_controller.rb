class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    # display a list of movies
    if !(params['o'] || params['ratings'])
      # load last values from session
      order_by, ratings = session['order_by'], session['ratings']
      if order_by || ratings
        # redirect to regular URI; otherwise, they have nothing stored, so there's no point.
        redirect_to movies_path({'o' => order_by, 'ratings' => ratings}) and return
      end
    else
      # fetch from params
      order_by, ratings = params['o'], params['ratings']
    end

    # sanitize @order_by and @ratings
    @order_by = ((['title', 'release_date'].member? order_by) && order_by) || 'title'
    @ratings = (ratings && ratings.select {|k, v| Movie.all_ratings.member? k}) || {}

    @all_ratings = Movie.all_ratings
    # todo: fix this repetition
    if ! @ratings.empty?
      @movies = Movie.order(@order_by).find_all_by_rating(@ratings.keys)
    else
      @movies = Movie.order(@order_by).all
    end

    # save last params into session
    session['order_by'] = @order_by
    session['ratings'] = @ratings
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
