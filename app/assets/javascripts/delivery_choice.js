$(function () {
  $("#item_delivery_fee_id").change(function () {
    var fee_id = $("#item_delivery_fee_id").val();
    $("#item_delivery_choice_id").empty();
    if (fee_id == 1) {
      $('.sell-form__delivery__form-box__choice').css({
        'display': 'block'
      });
      $('#item_delivery_choice_id').css({
        'display': 'block'
      });
      $("#item_delivery_choice_id").append(
        ' <option value="---">---</option>\
          <option value="0">未定</option>\
          <option value="1">らくらくメルカリ便</option>\
          <option value="2">ゆうメール</option>\
          <option value="3">レターパック</option>\
          <option value="4">普通郵便(定形、定形外)</option>\
          <option value="5">クロネコヤマト</option>\
          <option value="6">ゆうパック</option>\
          <option value="7">クリックポスト</option>\
          <option value="8">ゆうパケット</option>'
      );
    } else if (fee_id == 2) {
      $('.sell-form__delivery__form-box__choice').css({
        'display': 'block'
      });
      $('#item_delivery_choice_id').css({
        'display': 'block'
      });
      $("#item_delivery_choice_id").append(
        ' <option value="---">---</option>\
          <option value="0">未定</option>\
          <option value="1">クロネコヤマト</option>\
          <option value="2">ゆうパック</option>\
          <option value="3">ゆうメール</option>'
      );
    } else {
      $('.sell-form__delivery__form-box__choice').css({
        'display': 'none'
      });
      $('#item_delivery_choice_id').css({
        'display': 'none'
      });
    }
  });
  $(window).ready(function () {
    var path = location.pathname
    if (path == "/items/new") {
      $('#new_item .sell-form__delivery__form-box__choice').css({
        'display': 'none'
      });
      $('#new_item #item_delivery_choice_id').css({
        'display': 'none'
      });
    }
  });
})