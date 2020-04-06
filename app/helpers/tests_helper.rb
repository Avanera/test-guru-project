module TestsHelper

  TEST_LEVELS = { 0 => I18n.t('helpers.label.test.easy'), 1 => I18n.t('helpers.label.test.elementary'), 2 => I18n.t('helpers.label.test.advanced'), 3 => I18n.t('helpers.label.test.hard') }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || I18n.t('helpers.label.test.hero')
    # case test.level
    # when 0
    #   'easy'
    # when 1
    #   'elementary'
    # when 2
    #   'advanced'
    # when 3
    #   'hard'
    # else
    #   'hero'
    # end
  end

end
