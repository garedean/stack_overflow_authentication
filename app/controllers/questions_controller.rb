class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    if current_user
      @user = User.find(current_user.id)
      @question = @user.questions.new(question_params)
      # @question = Question.new(question_params)
      # @question[:user_id] = current_user.id
      if @question.save
        redirect_to questions_path
      else
        redirect_to :back
      end
    else
      flash[:alert] = "You are not logged in. Question Submission Disabled."
      redirect_to '/'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end

end
