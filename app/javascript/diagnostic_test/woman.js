$(function () {
  $(".btn").on("click", function (e) {
    e.preventDefault();  // デフォルトのリンク動作を無効にする
    // 現在の質問を非表示にする
    $(this).closest("div").hide();

    // 次の質問のIDを取得して表示
    const nextQuestion = $(this).attr("href");
    $(nextQuestion).fadeIn("slow").show();
  });
});
