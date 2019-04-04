class HomePageController < ApplicationController
  def home
    @tasks = Task.all
  end
end
