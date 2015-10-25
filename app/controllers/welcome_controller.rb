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

  def search
    search_terms = params[:terms].downcase.split(" ")
    @matches = []
    search_terms.each do |term|
      @matches += Question.all.select { |question| question.title.downcase.include?(term) }
    end
    @matches = @matches.uniq
    render 'search'
  end
end
