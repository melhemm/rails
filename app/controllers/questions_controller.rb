class QuestionsController < ApplicationController

  # before_action :find_test
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    # render inline: "<%= @test.title %>"
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_pramas)
    if @question.save
      render :show
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id]) 
    @question = Question.destroy(params[:id])
    redirect_to root_path
  end

  private

  def question_pramas
    params.require(:question).permit(:body, :test_id)  
  end

  # def find_test
  #   @test = Test.find(params[:id])
  # end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
  
end
