$(function () {
  $(".sell-form__selling-price__input__right__yen").on("keyup", function () {
    var input = $(".sell-form__selling-price__input__right__yen").val();
    var commission = parseInt(input / 10);
    var profit = (input - commission)
    if (isNaN(commission) == false && input >= 300 && input <= 9999999) {
      $(".sell-form__selling-price__commission__right").text("¥" + commission.toLocaleString());
      $(".sell-form__selling-price__profit__right").text("¥" + profit.toLocaleString());
    } else {
      $(".sell-form__selling-price__commission__right").text("-");
      $(".sell-form__selling-price__profit__right").text("-");
    }
  });
});