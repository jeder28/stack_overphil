class AnswersController < ApplicationController
  def create
    @answer = Answer.new(params[:answer].permit(:content))
    @answer.question = Question.find(params[:question_id])
    @answer.answerer = current_user
    if @answer.save
      if request.xhr?
        render 'answers/_answer.html.erb', locals: {answer: @answer}, layout: false
      else
        redirect_to question_path(@answer.question)
      end
    else
      @question = Question.find(params[:question_id])
      @errors = @answer.errors.full_messages
      render 'questions/show.html.erb'
    end
  end

  def best
    best_answer_id = params[:best_answer_id]
    @question = Answer.find(best_answer_id).question
    @question.update_attribute(:best_answer_id, best_answer_id)
    redirect_to question_path(@question)
  end

end