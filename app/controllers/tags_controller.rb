class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @photos = @tag.photos
  end
end
