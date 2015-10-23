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
  end



end