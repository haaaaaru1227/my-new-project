// JavaScriptコードでフォームの動作を追加
document.addEventListener('DOMContentLoaded', function () {
  const form = document.getElementById('surveyForm');
  const isLearningRadios = document.getElementsByName('isLearning');
  const wasLearningRadios = document.getElementsByName('wasLearning');
  const additionalQuestion = document.getElementById('additionalQuestion');

  // isLearningとwasLearningの変更を監視
  function checkLearningStatus() {
      const isLearning = Array.from(isLearningRadios).find(radio => radio.checked)?.value;
      const wasLearning = Array.from(wasLearningRadios).find(radio => radio.checked)?.value;

      // Q3の質問の表示条件: Q1またはQ2で「はい」を選択した場合に表示
      if (isLearning === 'はい' || wasLearning === 'はい') {
          additionalQuestion.style.display = 'block';
      } else {
          additionalQuestion.style.display = 'none';
      }
  }

  // ラジオボタンにイベントリスナーを追加
  isLearningRadios.forEach(radio => radio.addEventListener('change', checkLearningStatus));
  wasLearningRadios.forEach(radio => radio.addEventListener('change', checkLearningStatus));

});


