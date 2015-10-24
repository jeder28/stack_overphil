class WelcomeController < ApplicationController
  def index
    if params[:order_by] == 'votes'
      @questions = Question.sort_by_votes
    elsif params[:order_by] == 'trendiness'
      @questions = Question.sort_by_trendiness
    elsif params[:order_by] == 'recentness'
      @questions = Question.sort_by_recentness
    else
      @questions = Question.all
    end
  end
end
