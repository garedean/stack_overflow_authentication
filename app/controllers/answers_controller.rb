class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer[:user_id] = current_user.id
    if @answer.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text)
  end
end
