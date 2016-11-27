class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  
  def show
    @posts = @category.posts.filtered(current_user)
    if location_coordinates
      @posts = @posts.near(location_coordinates, Post::NO_LIMIT)
    end
    
    @posts = @posts.paginate(page: params[:page])

    respond_to do |format|
      if params[:page]
        format.js { render file: 'market/load_more' }
      else
        format.js { render file: 'market/load_first' }
      end
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
