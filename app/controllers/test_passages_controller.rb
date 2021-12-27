class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[update show result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
  
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist 
    result = GistQuestionService.new(@test_passage.current_question)
    result.call

    flash_options = if result.success?
      { notice: t('.success', url: result.gist_url) }
    else
      { notice: t('.failure')}
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def create_gist!(service, result)
    if service.success?
      gist_url = result.html_url

      current_user.gist.create(question: @test_passage.current_question, gist_url: gist_url)
      { safe_notice: t('.success', gist_url: gist_url) }
    else
      { alert: t('.failure') }
    end
  end

end
