class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      reward(badge) if send("#{badge.reward_rule}?", badge.value) && !UserBadge.find_by(user_id: @user.id, badge_id: badge.id)
    end
  end

  def reward(badge)
    @user.badges << badge
  end

  def all_in_category?(category_id)
    @test_passage.passed? && @user.tests.where('category_id = ?', category_id).uniq.count == Test.where('category_id = ?', category_id).count
  end

  def first_attempt?(test_id)
    @user.tests.where(id: @test_passage.test_id).count == 1 && @test_passage.passed == true
  end

  def level_choice?(level)
    Test.where(level: level).count == 0 ? false :
      Test.where(level: level).count == @user.completed_tests.where(level: level).count
  end
end
