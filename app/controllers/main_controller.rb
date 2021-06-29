class MainController < ApplicationController
  def index
    flash[:notice] = "Logged in sucessfully"
    flash[:alert] = "Invalid email or password"
    end
end