class HomeController < ApplicationController
  def index
    if user_signed_in? # this is a devise helper
      redirect_to posts_path
    end
  end
end
