class GistsController < ApplicationController
  before_action :find_test_passage

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

      flash_options = if result.success?
        Gist.create!(question: @test_passage.current_question, gist_url: result.gist_url, user: current_user)
        {notice: t('.success', gist_url: result.gist_url) }
      else
        { notice: t('.failure')}
      end
      
    redirect_to @test_passage , flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

end