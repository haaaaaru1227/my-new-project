class DiagnosticTestController < ApplicationController
  def woman
    @questions = [
      { id: 'q_01', text: "あなたは普段、話すペースが速いですか？", options: ["話すペースが速い", "話すペースがゆっくり"] },
      { id: 'q_02', text: "あなたは普段、相手との会話で", options: ["間をとらずに話す", "間をとりながら話す"] },
      { id: 'q_03', text: "あなたの話し方は", options: ["語尾がキッパリ", "語尾がソフト"] },
      # 他の質問をここに追加
    ]

    # 回答データの初期化
    @count_a = 0
    @count_b = 0
  end
    # 結果表示のためのアクション
  def result
    @count_a = params[:count_a].to_i
    @count_b = params[:count_b].to_i
  end
end
