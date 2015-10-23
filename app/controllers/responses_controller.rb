class ResponsesController < ApplicationController

  def new
    @response = Response.new
    @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(params[:question_id])
    @qustion.responses.build(responder_id: 1, content: params[:content])
    if @question.save
      redirect_to questions_show_path(@question)
    else
      flash[:message] = "Failed to comment successfully."
      render :new
    end
  end

end

