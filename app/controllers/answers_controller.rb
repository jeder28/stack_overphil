class AnswersController < ApplicationController
  def create
    @answer = Answer.new(params[:answer].permit(:content))
    @answer.question = Question.find(params[:question_id])
    @answer.answerer = current_user
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

  def best
    puts "THIS IS PARAMS"
    puts params
    puts "ABOVE IS PARAMS"
    best_answer_id = params[:best_answer_id]
    @question = Answer.find(best_answer_id).question
    @question.update_attribute(:best_answer_id, best_answer_id)
    redirect_to question_path(@question)
  end

end