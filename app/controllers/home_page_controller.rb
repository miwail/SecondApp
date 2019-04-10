# frozen_string_literal: true

class HomePageController < ApplicationController
  def home
    @tasks = Task.all
  end
end
