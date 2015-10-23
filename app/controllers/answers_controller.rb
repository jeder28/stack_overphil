class AnswersController < ApplicationController
  def create
    @answer = Answer.new(params[:answer].permit(:content))
    @answer.question = Question.find(params[:question_id])
    #NEEDS TO BE CHANGED WHEN USER AUTHENTICATION IS SET
    @answer.answerer = User.first 
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      @question = Question.find(params[:question_id])
      flash[:notice] = @answer.errors.full_messages.join(", ")
      render 'questions/show.html.erb'
    end
  end

  def new
    
  end

end