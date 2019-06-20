$(function () {
  $("#delivery_fee").one("change", function () {
    $('.sell-form__delivery__form-box__choice').css({
      'display': 'block'
    });
  });
})