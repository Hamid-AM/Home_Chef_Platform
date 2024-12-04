class PagesController < ApplicationController
  def home
    @chefs = User.where(role: 'chef')
  end
end
