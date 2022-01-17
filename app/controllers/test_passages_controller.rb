class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[update show result]

  def show; end

  def result
    if @test_passage.success?

      @test_passage.update(passed: true)
      @badge = BadgeService.new(@test_passage).find_badges
      
      if @badge.present?
        
        current_user.badges.push(@badge)
        flash[:notice] = "You win"
      end
    end
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?

      TestsMailer.completed_test(@test_passage).deliver_now
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
