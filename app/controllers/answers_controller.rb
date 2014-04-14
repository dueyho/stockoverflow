class AnswersController < ApplicationController
  before_filter :authorize, except: [:show]

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = current_user.answers.create(answers_params)
    respond_to do |format|
      format.html{ redirect_to answers_url }
      format.js
    end
  end

  def edit
    @answer = Answer.find(params[:id])

  end

  def update
    @answer = Answer.find(params[:id])
    answers = Answer.all
    if answers.find_by(:best_answer => true) == nil
      @answer.update(:best_answer => params[:best_answer])
    end
    respond_to do |format|
      format.html {redirect_to answers_url }
      format.js
    end
  end

  def destroy
    @answer = Answer.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to answers_url }
      format.js
    end
  end

private

  def answers_params
    params.require(:answer).permit(:answer_text, :user_id, :question_id, :best_answer)
  end
end
