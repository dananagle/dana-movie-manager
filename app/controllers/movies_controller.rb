class MoviesController < ApplicationController
#  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def dashboard
  end

  #  def show
  #  end

  # GET /movies

  def index
    @movies = Movie.all
    @sort_column = sort_column
    @movies = Movie.order(@sort_column.order)
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
#  def edit
#  end

  # POST /movies

  def create
#    respond_to do |format|
#      if @movie.save
#        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
#      else
#        format.html { render :new }
#      end
#    end
  #end
    @movie = Movie.new params.require(:movie).permit(:title, :release, :format, :length, :rating)
    @movie.save!
    redirect_to index_path
  end

  def show
    @movie = Movie.find params[:id]
  end

  def edit
    @movie = Movie.find params[:id]
  end

  # PATCH/PUT /movies/1

  def update
#    respond_to do |format|
      @movie = Movie.find params[:id]
      if @movie.update params.require(:movie).permit(:title, :release, :format,  :length, :rating)
        redirect_to index_path
      else
        render :edit
    end
  end

  def sort_column
   title_sort = SortableTable::SortColumnCustomDefinition.new('title',
     asc: 'title asc',
     desc: 'title desc')

   release_sort = SortableTable::SortColumnDefinition.new('release')

   format_sort = SortableTable::SortColumnDefinition.new('format')

   length_sort = SortableTable::SortColumnDefinition.new('length')

   rating_sort = SortableTable::SortColumnDefinition.new('rating')

   sort_table = SortableTable::SortTable.new([title_sort, release_sort, format_sort, length_sort, rating_sort])
   sort_table.sort_column(params[:sort], params[:direction])
 end

  # DELETE /movies/1

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

#    respond_to do |format|
#      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
#      format.json { head :no_content }
#    end
  end

#  private
    # Use callbacks to share common setup or constraints between actions.
#    def set_movie
#      @movie = Movie.find(params[:id])
#    end

    # Never trust parameters from the scary internet, only allow the white list through.
#    def movie_params
#      params.require(:movie).permit(:title, :format, :length, :release, :rating)
#    end
end
