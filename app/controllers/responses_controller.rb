class ResponsesController < ApplicationController

  def new
    @response = Response.new
    @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(params[:question_id])
    @question.responses.build(responder_id: current_user.id, content: params[:response][:content])
    if @question.save
      redirect_to question_path(@question)
    else
      flash[:message] = "Failed to comment successfully."
      render :new
    end
  end

end

