class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    id = params[:id]
    @list = List.find(id)
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end
end

    private

def set_list
  id = params[:id]
  @list = List.find(id)
end

def list_params
  params.require(:list).permit(:name)
end
