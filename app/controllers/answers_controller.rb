class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if current_user
      @answer[:user_id] = current_user.id
    else
      @answer[:user_id] = 2
    end
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
