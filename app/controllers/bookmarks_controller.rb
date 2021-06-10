class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    set_bookmark
    list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(list)
  end

  private

  def set_bookmark
    id = params[:id]
    @bookmark = Bookmark.find(id)
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
