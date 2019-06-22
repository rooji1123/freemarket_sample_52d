$(function () {
  $("#item_delivery_fee_id").change(function () {
    var fee_id = $("#item_delivery_fee_id").val();
    if (fee_id == 1) {
      $('.sell-form__delivery__form-box__choice').css({
        'display': 'block'
      });
      $('#item_delivery_choice_id').css({
        'display': 'block'
      });
      $('#item_delivery_choice_sub_id').css({
        'display': 'none'
      });
    } else if (fee_id == 2) {
      $('.sell-form__delivery__form-box__choice').css({
        'display': 'block'
      });
      $('#item_delivery_choice_id').css({
        'display': 'block'
      });
    } else {
      $('.sell-form__delivery__form-box__choice').css({
        'display': 'none'
      });
      $('#item_delivery_choice_id').css({
        'display': 'none'
      });
    }
  });
})