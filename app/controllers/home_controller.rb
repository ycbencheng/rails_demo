class HomeController < ApplicationController
  def index
    @widgets = Widget.all
  end
end
