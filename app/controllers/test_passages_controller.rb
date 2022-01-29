class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[update show result]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed? || @test_passage.time_up?
      TestsMailer.completed_test(@test_passage).deliver_now

      if @test_passage.success?
        @test_passage.update(passed: true)
        badge = BadgeService.new(@test_passage).call
        flash[:notice] = "Achievement"
      end
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
