class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
    type = (params[:vote][:votable_type])
    if type == "Question"
      object = Question.find_by(id: params[:vote][:votable_id])
      @question = Question.find(params[:vote][:votable_id])
    elsif type == "Response"
      object = Response.find_by(id: params[:vote][:votable_id])
      response = Response.find(params[:vote][:votable_id])
      if response.respondable_type == "Question"
        @question = Question.find(response.respondable_id)
      elsif response.respondable_type == "Answer"
        @question = Answer.find(response.respondable_id).question
      end
    elsif type == "Answer"
      object = Answer.find_by(id: params[:vote][:votable_id])
      @question = Answer.find(params[:vote][:votable_id]).question
    end
    if @vote.save
      object.reload
      if request.xhr?
        render '/questions/_disabled_votes.html.erb', locals: {object: object}, layout: false
      else
        redirect_to question_path(@question)
      end
    else
      flash[:notice] = @vote.errors.full_messages.join(", ")
      render 'questions/show.html.erb'
    end
  end

  def vote_params
    params.require(:vote).permit(:value, :voter_id, :votable_id, :votable_type)
  end

end