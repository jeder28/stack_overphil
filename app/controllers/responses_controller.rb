class ResponsesController < ApplicationController

  def new
    if current_user != nil
      @parent = parent_object
      @parent_name = @parent.class.name.downcase.pluralize
      @response = Response.new
    else
      redirect_to login_path
    end
  end

  def create
    @parent = parent_object
    @response = @parent.responses.build(responder_id: current_user.id, content: params[:response][:content])
    if @response.save
      redirect_to parent_url(@parent)
    else
      flash[:message] = "Failed to comment successfully."
      render :new
    end
  end

  private

  def parent_object
    case
      when params[:question_id] then Question.find(params[:question_id])
      when params[:answer_id] then Answer.find(params[:answer_id])
    end
  end

  def parent_url(parent)
    case
      when params[:question_id] then question_path(parent)
      when params[:answer_id] then question_path(parent.question_id)
    end
  end

end

