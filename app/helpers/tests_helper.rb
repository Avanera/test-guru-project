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
end
