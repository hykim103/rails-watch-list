class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@bookmark)
    else
      render :new_list_bookmark, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
  end
end
