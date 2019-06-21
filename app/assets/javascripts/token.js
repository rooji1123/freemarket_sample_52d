$(document).on('turbolinks:load', function() {
  var form = $("#charge-form");
  Payjp.setPublicKey('pk_test_1fc85b9008fbb18d92cb8f0b');

  $(".item__main__detail__left").on("click", function(e) {
    e.preventDefault();
    form.find("input[type=submit]");
    var card = {
        number: parseInt($("#payment_card_no").val()),
        cvc: parseInt($("#payment_card_security_code").val()),
        exp_month: parseInt($("#payment_card_expire_mm").val()),
        exp_year: parseInt($("#payment_card_expire_yy").val())
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert("error")
        form.find('button').prop('disabled', false);
      }
      else {
        var token = response.id;
        $(".item__main__price__right").append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));
      }
    });
  });
});