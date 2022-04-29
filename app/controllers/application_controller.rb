class ApplicationController < ActionController::Base
    before_action :set_categories
    before_action :set_query

    def set_query
        @query = Post.ransack(params[:q])
    end

    private

    def set_categories
        @nav_categories = Category.where(display_in_nav: true).order(:name)
    end

end
