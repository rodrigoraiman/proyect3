class ApplicationController < ActionController::Base
    before_action :set_categories
    before_action :set_query
    helper_method :current_cart

    protected

    def current_cart
        return @cart unless @cart.nil?
        
        cart = Cart.find_or_create_by(id: session[:cart_id])
        session[:cart_id] = cart.id
        cart
    end

    def set_query
        @query = Post.ransack(params[:q])
    end

    def is_admin!
        redirect_to root_path, alert: "You are not authorized to do that." unless current_user&.admin?
    end

    private

    def set_categories
        @nav_categories = Category.where(display_in_nav: true).order(:name)
    end

end
