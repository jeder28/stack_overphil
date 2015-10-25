class QuestionsController < ApplicationController
  def index
  end

  def new
    if logged_in?
      @question = Question.new
      @tag = Tag.new
    else
      redirect_to login_path
    end
  end

  def create
    if logged_in?
      @question = Question.new(params[:question].permit(:title, :content))
      @question.asker_id = current_user.id
      if @question.save
        redirect_to question_path(@question)
        if tag_params != nil
          Tag.make_tags(tag_params[:name], question)
        end
      else
        flash[:notice] = @question.errors.full_messages.join(", ")
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def show
    @question = Question.find_by(id: params[:id])
    @question.update_attributes(view_count: (@question.view_count + 1))
    @answer = Answer.new
    @vote = Vote.new
  end

  private

  def tag_params
    params.require(:question).require(:tag).permit(:name)
  end

end

