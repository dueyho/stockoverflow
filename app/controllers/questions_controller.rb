class QuestionsController < ApplicationController
 before_filter :authorize, only: [:new, :create]

 def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.create(questions_params)
    redirect_to root_path
  end

  def show
    @answer = Answer.new
    @question = Question.find(params[:id])
  end

private

  def questions_params
    params.require(:question).permit(:description, :user_id)
  end

end
