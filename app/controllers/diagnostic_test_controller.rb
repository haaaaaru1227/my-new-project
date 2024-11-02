class DiagnosticTestController < ApplicationController

  def select_gender
    # 性別選択のロジック
  end

  def woman
     # 長さのロジック
  end
  
  def man
    # メンズスタイル
  end

  def style
    hair_length = params[:hair_length]  # パラメータで髪の長さを受け取る
  puts "Received hair length: #{hair_length}" 

    # 髪の長さに応じて質問を取得
    @questions = case hair_length
                 when 'long'
                   QuestionData.long_questions
                 when 'bob'
                   QuestionData.bob_questions
                 when 'short'
                   QuestionData.short_questions
                 else
                   []
                 end

    # 質問を表示するビューをレンダリング
    respond_to do |format|
      format.html { render :show_questions }
      format.json { render json: { questions: @questions } }
    end
  end

  def result
    hair_length = params[:hair_length]  # パラメータで髪の長さを受け取る
    count_a = params[:count_a].to_i
    count_b = params[:count_b].to_i
  
    puts "Received hair length in result: #{hair_length}"  # デバッグ用出力
    puts "params[:hair_length]: #{params[:hair_length]}"
  puts "params[:count_a]: #{params[:count_a]}"
  puts "params[:count_b]: #{params[:count_b]}"

    @result_title, @result_message = generate_result(hair_length, count_a, count_b)
  
    respond_to do |format|
      format.html { render :result }
      format.json { render json: { title: @result_title, message: @result_message } }
    end
  end
  

  protected


  # 結果を生成するロジックを共通化
  def generate_result(hair_length, count_a, count_b)
    puts "params[:hair_length]: #{hair_length}"
    puts "params[:count_a]: #{count_a}"
    puts "params[:count_b]: #{count_b}"

    case hair_length
    when 'long'
      if count_a > count_b
        ['ロングスタイル - 結果', 'あなたはロングスタイルでレイヤーが入ったスタイルがおすすめです。']
      else
        ['ロングスタイル - 結果', 'あなたはロングスタイルでまとまりがある重めのスタイルがおすすめです。']
      end
    when 'bob'
      if count_a > count_b
        ['ボブスタイル - 結果', 'あなたは前下がりボブ、外ハネやレイヤーの入ったスタイルがおすすめです。']
      else
        ['ボブスタイル - 結果', 'あなたは切りっぱなしボブや内巻きのスタイルがおすすめです。']
      end
    when 'short'
      if count_a > count_b
        ['ショートスタイル - 結果', 'あなたはショートボブスタイルがおすすめです。']
      else
        ['ショートスタイル - 結果', 'あなたはスッキリショートがおすすめ']
      end
    else
      ['エラー', '髪の長さが指定されていません。']
    end
  end
end
