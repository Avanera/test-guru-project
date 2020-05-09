class BadgesAwardService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @badges_count = @user.badges.count
  end

  def call
    Badge.all.each do |badge|
      reward(badge) if send("#{badge.rule}?")
    end
  end

  def awarded?
    @badges_new_count - @badges_count >= 1
  end

  private

  def reward(badge)
    @user.badges.push(badge)
    @badges_new_count = @badges_count + 1
  end

  def category_complete?
    category_id = @test_passage.test.category_id
    @user.tests.where('category_id = ?', category_id).distinct.count == Test.ready.where('category_id = ?', category_id).distinct.count
  end

  def level_complete?
    level = @test_passage.test.level
    @user.tests.where('level = ?', level).distinct.count == Test.ready.where('level = ?', level).distinct.count
  end

  def first_try?
    @user.tests.where('test_id = ?', @test_passage.test_id).count == 1
  end
end
