class PagesController < ApplicationController
  def home
    @chefs = User.where(role: 'chef')
        # Geocoder
        @markers = @chefs.geocoded.map do |chef|
          {
            lat: chef.latitude,
            lng: chef.longitude,
            info_window_html: render_to_string(partial: "/users/info_window", locals: {chef: chef})
          }
        end
  end
end
