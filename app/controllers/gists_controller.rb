class GistsController < ApplicationController
  before_action :find_test_passage

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create!(question: @test_passage.current_question, gist_url: result.html_url,
                  user: current_user)
      link = t('.success')
      flash[:notice] = %Q[<a href="#{result.html_url}">#{link}</a>]
    else
      { notice: t('.failure') }
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
