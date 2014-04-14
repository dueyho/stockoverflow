class HomeController < ApplicationController
  def index
    @questions = Question.all
    render 'index.html.erb'
  end
end
