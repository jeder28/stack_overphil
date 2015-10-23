class ResponsesController < ApplicationController

def new
  # @params = params[:question_id]
  # # @question = Question.find(params[:question])
  @response = Response.new
  @question = Question.find(params[:question_id])
end

def create

end

end