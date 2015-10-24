class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
    type = (params[:vote][:votable_type])
    if type == "Question"
      @question = Question.find(params[:vote][:votable_id])
    end
    if type == "Response"
      response = Response.find(params[:vote][:votable_id])
      if response.respondable_type == "Question"
        @question = Question.find(response.respondable_id)  
      end
      if response.respondable_type == "Answer"
        @question = Answer.find(response.respondable_id).question  
      end
    end
    if type == "Answer"
      @question = Answer.find(params[:vote][:votable_id]).question
    end
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