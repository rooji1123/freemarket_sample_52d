$(function () {
  $("#item_delivery_fee_id").one("change", function () {
    $('.sell-form__delivery__form-box__choice').css({
      'display': 'block'
    });
    $('#item_delivery_choice_id').css({
      'display': 'block'
    });
  });
})