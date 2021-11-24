class TestsController < ApplicationController

  def index
   render plain: @tests = Test.all.inspect
  end
end
