document.addEventListener("DOMContentLoaded", function() {
  const button = document.getElementById("start-button");

  if (button) {
    button.addEventListener("click", function() {
      window.location.href = "<%= diagnostic_test_woman_path %>";
    });
  }
});
