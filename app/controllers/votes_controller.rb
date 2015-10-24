class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
    @question = Question.find(params[:vote][:votable_id])
      if @vote.save    
        redirect_to question_path(@question)
      else
        flash[:notice] = @vote.errors.full_messages.join(", ")
        render 'questions/show.html.erb'
      end
  end

  def vote_params
    params.require(:vote).permit(:value, :voter_id, :votable_id, :votable_type)
  end

end