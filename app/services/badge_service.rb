class BadgeService

  LEVEL = 1
  CATEGORY_TYPE = "back-end"

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def find_badges
    Badge.all.map { |badge| send("#{badge.reward_rule}_award", badge) }.compact
  end

  private

  def attempt_award(badge)
    badge if first_attempt?(@test)
  end

  def level_award(badge)
    badge if level_choice?(LEVEL)
  end

  def category_award(badge)
    badge if all_in_category?(CATEGORY_TYPE)
  end

  def all_in_category?(category_name)
    Test.categories_by_name(category_name).count == 0 ? false :
      Test.categories_by_name(category_name).count == @user.completed_tests.categories_by_name(category_name).count
  end
  
  def first_attempt?(test)
    @user.tests.where(id: @test_passage.test_id).count == 1 && @test_passage.passed == true
  end

  def level_choice?(level)
    Test.where(level: level).count == 0 ? false :
      Test.where(level: level).count == @user.completed_tests.where(level: level).count
  end
end
