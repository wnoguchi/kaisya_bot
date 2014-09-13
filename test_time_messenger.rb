
require './time_messenger'
require 'test/unit'

class TestTimeMessenger < Test::Unit::TestCase
  def test_weekday
    ret = TimeMessenger.get_wday_symbol(0)
    assert_equal(:sun, ret)
    ret = TimeMessenger.get_wday_symbol(6)
    assert_equal(:sat, ret)
    ret = TimeMessenger.get_wday_symbol(7)
    assert_equal(nil, ret)
  end
  
  def test_weekday_str
    assert_equal('日', TimeMessenger.get_wday_str(:sun))
    assert_equal('月', TimeMessenger.get_wday_str(:mon))
    assert_equal('火', TimeMessenger.get_wday_str(:tue))
    assert_equal('水', TimeMessenger.get_wday_str(:wed))
    assert_equal('木', TimeMessenger.get_wday_str(:thu))
    assert_equal('金', TimeMessenger.get_wday_str(:fri))
    assert_equal('土', TimeMessenger.get_wday_str(:sat))
  end
  
  def test_get_time_str
    assert_equal('2009年1月11日（日）', TimeMessenger.get_time_str(2009, 1, 11, 0))
    assert_equal('2010年2月12日（月）', TimeMessenger.get_time_str(2010, 2, 12, 1))
    assert_equal('2011年3月13日（火）', TimeMessenger.get_time_str(2011, 3, 13, 2))
    assert_equal('2012年4月14日（水）', TimeMessenger.get_time_str(2012, 4, 14, 3))
    assert_equal('2013年5月15日（木）', TimeMessenger.get_time_str(2013, 5, 15, 4))
    assert_equal('2014年6月16日（金）', TimeMessenger.get_time_str(2014, 6, 16, 5))
    assert_equal('2015年7月17日（土）', TimeMessenger.get_time_str(2015, 7, 17, 6))
  end
  
  def test_get_message
    sun = 0
    sat = 6
    mon = 1

    hour = 8
    assert_not_equal(nil, TimeMessenger.get_message(2011, 6, 12, sat, hour).index('何して'))
    assert_not_equal(nil, TimeMessenger.get_message(2011, 6, 12, sun, hour).index('何して'))
    assert_equal(nil, TimeMessenger.get_message(2011, 6, 12, mon, hour).index('何して'))
    
    hour = 9
    assert_equal(nil, TimeMessenger.get_message(2011, 6, 12, sat, hour))
    assert_equal(nil, TimeMessenger.get_message(2011, 6, 12, sun, hour))
    assert_not_equal(nil, TimeMessenger.get_message(2011, 6, 12, mon, hour).index('始業時刻'))
    
    hour = 13
    assert_not_equal(nil, TimeMessenger.get_message(2011, 6, 12, sat, hour).index('午後は何をして'))
    assert_not_equal(nil, TimeMessenger.get_message(2011, 6, 12, sun, hour).index('午後は何をして'))
    assert_equal(nil, TimeMessenger.get_message(2011, 6, 12, mon, hour).index('午後は何をして'))
    
    hour = 18
    assert_equal(nil, TimeMessenger.get_message(2011, 6, 12, sat, hour))
    assert_equal(nil, TimeMessenger.get_message(2011, 6, 12, sun, hour))
    assert_not_equal(nil, TimeMessenger.get_message(2011, 6, 12, mon, hour).index('終業時刻'))
    
    hour = 22
    assert_equal(nil, TimeMessenger.get_message(2011, 6, 12, sat, hour))
    assert_not_equal(nil, TimeMessenger.get_message(2011, 6, 12, sun, hour).index('明日は会社'))
    assert_not_equal(nil, TimeMessenger.get_message(2011, 6, 12, mon, hour).index('残業ですか？'))
    
  end
end
