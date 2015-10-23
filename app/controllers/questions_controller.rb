class QuestionsController < ApplicationController
  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question].permit(:title, :content))
    if @question.save
      redirect_to question_path(@question)
    else
      flash[:notice] = @question.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @question = Question.find_by(id: params[:id])
    @question.update_attributes(:view_count, view_count + 1)
    @answer = Answer.new
  end



end