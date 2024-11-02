module QuestionData
  def self.long_questions
    [
      { id: 'q_01', text: "普段のスタイリング方法は？", options: [{ text: "アイロンやコテでスタイリングする", group: 'A' }, { text: "１つにまとめることが多い", group: 'B' }] },
      { id: 'q_02', text: "あなたの髪質は？", options: [{ text: "癖が少なくまとまりがある", group: 'A' }, { text: "癖がありボリュームが出やすい", group: 'B' }] },
      { id: 'q_03', text: "好みのスタイルの雰囲気は？", options: [{ text: "軽めの動きが出るスタイル", group: 'A' }, { text: "まとまりのあるナチュラルなスタイル", group: 'B' }] }
    ]
  end

  def self.bob_questions
    [
      { id: 'q_01', text: "普段のスタイリング方法は？", options: [{ text: "アイロンやコテでスタイリングする", group: 'A' }, { text: "出来たら１つにまとめたい", group: 'B' }] },
      { id: 'q_02', text: "あなたの髪質は？", options: [{ text: "癖が少なくまとまりがある", group: 'A' }, { text: "癖がありボリュームが出やすい", group: 'B' }] },
      { id: 'q_03', text: "好みのスタイルの雰囲気は？", options: [{ text: "外ハネや動きのあるスタイル", group: 'A' }, { text: "まとまりのある扱いやすいスタイル", group: 'B' }] }
    ]
  end

  def self.short_questions
    [
      { id: 'q_01', text: "普段のスタイリング方法は？", options: [{ text: "アイロンやコテでスタイリングする", group: 'A' }, { text: "ワックスなどでスタイリングする", group: 'B' }] },
      { id: 'q_02', text: "ショートヘアのスタイリングで気をつけていることは？", options: [{ text: "ボリューム感", group: 'A' }, { text: "シルエット", group: 'B' }] },
      { id: 'q_03', text: "どの頻度でカットしますか？", options: [{ text: "２・３ヶ月に一回", group: 'A' }, { text: "１ヶ月から１.５ヶ月", group: 'B' }] }
    ]
  end
end
