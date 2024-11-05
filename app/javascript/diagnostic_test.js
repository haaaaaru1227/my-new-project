document.addEventListener("DOMContentLoaded", function() {
  console.log("JavaScriptが読み込まれました");

  var currentIndex = 0;
  var questions = document.querySelectorAll('.question');
  var answers = {};  // ユーザーの回答を保存するオブジェクト
  var countA = 0;
  var countB = 0;
  var buttons = document.querySelectorAll('.btn');
  console.log("取得したボタンの数:", buttons.length);

  // URLから髪の長さを取得する関数
  function getHairLengthFromURL() {
    const urlParams = new URLSearchParams(window.location.search);
    const hairLength = urlParams.get('hair_length');
    console.log('取得した髪の長さ:', hairLength);
    return hairLength;
  }

  // 髪の長さを取得
  var hairLength = getHairLengthFromURL();

  buttons.forEach(function(button) {
    button.addEventListener('click', function(event) {
      
      console.log("ボタンが押されました:", this);

      var questionId = this.getAttribute('data-question-id');
      var answer = this.getAttribute('data-answer');
      var group = this.getAttribute('data-group');

      // 回答を保存
      answers[questionId] = answer;

      // AかBをカウント
      if (group === 'A') {
        countA++;
      } else if (group === 'B') {
        countB++;
      }

      // 現在の質問を非表示
      questions[currentIndex].style.display = 'none';
      currentIndex++;

      // 次の質問を表示、質問がなければ結果ページへ遷移
      if (currentIndex < questions.length) {
        questions[currentIndex].style.display = 'block';
      } else {
        submitResults();
      }
    });
  });

  function submitResults() {
    console.log("サーバーに回答を送信します。");

    // 回答をサーバーに送信して結果ページにリダイレクト
    fetch('/diagnostic_test/result', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({
        hair_length: hairLength,
        count_a: countA,
        count_b: countB
      })
    })
    .then(response => response.json())
    .then(data => {
      console.log("サーバーからのレスポンス:", data);

      const url = `/diagnostic_test/result?title=${encodeURIComponent(data.title)}&message=${encodeURIComponent(data.message)}&hair_length=${encodeURIComponent(hairLength)}&count_a=${encodeURIComponent(countA)}&count_b=${encodeURIComponent(countB)}`;
      window.location.href = url;
    })
    .catch(error => console.error('サーバー通信中にエラーが発生しました:', error));
  }
});
