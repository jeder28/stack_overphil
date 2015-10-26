class ResponsesController < ApplicationController

  def new
    if current_user != nil
      @parent = parent_object
      @parent_name = @parent.class.name.downcase.pluralize
      @response = Response.new
      if request.xhr?
        render 'responses/_response_form.html.erb', locals: {parent: @parent, response: @response}, layout: false
      else
        render 'responses/new.html.erb'
      end
    else
      redirect_to login_path
    end
  end

  def create
    @parent = parent_object
    @response = @parent.responses.build(responder_id: current_user.id, content: params[:response][:content])
    if @response.save
      if request.xhr?
        render 'responses/_response.html.erb', locals: {response: @response}, layout: false
      else
        redirect_to parent_url(@parent)
      end
    else
      flash.now[:alert] = "Comment must have content."
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

