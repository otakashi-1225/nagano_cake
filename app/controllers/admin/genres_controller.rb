class Admin::GenresController < ApplicationController
  def index
    @new_genre = Genre.new
    @genres = Genre.page(params[:page])
  end

  def create
    @new_genre = Genre.new(genre_params)
    if @new_genre.save
      flash[:notice] = "新しいジャンルを追加しました!!"
      redirect_to admin_genres_path
    else
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "新しいジャンルを追加しました!!"
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
