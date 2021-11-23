class TestsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
  
  end

  def new
    @test = Question.new
  end

end
