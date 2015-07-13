class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create

    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Your question has been added!"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "There was a problem adding your question. Please try again."
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:description_a, :image_a, :description_b, :image_b)
  end
end
