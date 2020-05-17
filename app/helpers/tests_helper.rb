module TestsHelper

  TEST_LEVELS = {
    0 => 'easy',
    1 => 'elementary',
    2 => 'advanced',
    3 => 'hard'
  }.freeze

  def test_level(test)
    I18n.t("helpers.label.test.#{TEST_LEVELS[test.level]}") ||
      I18n.t('helpers.label.test.hero')
  end

  def human_timer(test)
    ActiveSupport::Duration.build(test.timer).inspect
  end

  # def test_is_ready?(test)
  #   test.questions.any? && test.questions.all? { |q| q.answers.correct.count.positive? }
  # end
end
