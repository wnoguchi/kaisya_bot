# -*- coding: utf-8 -*-
class TimeMessenger
  def self.get_message(year, month, mday, wday, hour)
    # 曜日を取得する
    weekday = TimeMessenger.get_wday_symbol(wday)
    
    case hour
    when 8
      ret = "おはようございます！今日は" << get_time_str(year, month, mday, wday) << "です。"
      if weekday == :sat or weekday == :sun
        ret <<= "何して過ごしましょうか？"
      end
      ret
    when 9
      "始業時刻です" if not (weekday == :sat or weekday == :sun)
    when 12
      if weekday == :sat or weekday == :sun
        "お昼です"
      else
        "お昼休みです"
      end
    when 13
      if weekday == :sat or weekday == :sun
        "午後は何をして過ごしましょうか"
      else
        "午後の部開始です"
      end
    when 15
      if weekday == :sat or weekday == :sun
        "15 時になりました"
      else
        "チョコレート、水分補給で頭をリフレッシュ"
      end
    when 18
      if not (weekday == :sat or weekday == :sun)
        if weekday == :fri
          "終業時刻となりました。今週もお疲れ様でした！"
        else
          "終業時刻となりました。今日も一日お疲れ様でした"
        end
      end
    when 20
      "(´･_･`)"
    when 21
      "(´･_･`)"
    when 22
      if weekday == :sat or weekday == :sun
        "明日は会社です。がんばりましょう・・・。" if weekday == :sun
      else
        "残業ですか？体を壊さないように気をつけて下さいね"
      end
    when 0
      "よるほー"
    when 1
      "おやすみなさい"
    when 2
      "zzz..."
    else
      nil
    end
  end
  
  def self.get_wday_symbol(wday)
    [ :sun, :mon, :tue, :wed, :thu, :fri, :sat ][wday]
  end

  def self.get_wday_str(wday)
    weekday = {
      :sun => '日',
      :mon => '月',
      :tue => '火',
      :wed => '水',
      :thu => '木',
      :fri => '金',
      :sat => '土',
    }
    weekday[wday]
  end
  
  def self.get_time_str(year, month, mday, wday)
    weekday = TimeMessenger.get_wday_str(TimeMessenger.get_wday_symbol(wday))
    "#{year}年#{month}月#{mday}日（#{weekday}）"
  end
  
end
