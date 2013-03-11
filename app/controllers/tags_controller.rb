class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @photos = Photo.tagged_with(@tag.name)
  end
end
