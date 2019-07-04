$(function(){
  $("#form-first .single-contents__form__content:first").find(".single-contents__form__content__lower__field").focus()
  //validate submit ,hide and show views
  //form-first
  $('#submit-form-first').on('click', function(e){
    e.preventDefault();
    //validate presence
    var nul;
    $('#form-first :required').each(function(){
      if($(this).val() == ""){
        nul = true;
        var label = $(this).parent().siblings('.single-contents__form__content__upper').children('label').text()
        var html = buildHtmlAttendNull(label)
        $(this).siblings('.attend-null').remove()
        $(this).parent().append(html)
      }else{
        nul = false;
      }
    })
    //validate type email
    var type;
    if ($("#user_email").val().match(/^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/)){
      type = true
    }else{
      type = false
      var html = buildHtmlAttendTypeError()
      $("#user_email").parent().children('.attend-type-error').remove()
      $("#user_email").parent().append(html)
    }
    //validate pass
    var pass;
    var confirm;
      if($("#user_password").length){
        if($("#user_password").val().match(/^[A-Za-z0-9]{6,128}$/)){
          pass = true
        }else{
          pass = false
          var html = buildHtmlAttendPass()
          $("#user_password").parent().children('.attend-pass').remove()
          $("#user_password").parent().append(html)
        }
        // validate confirm pass
        if($("#user_password_confirmation").val().match($("#user_password").val())){
          confirm = true
        }else{
          confirm = false
          var html = buildHtmlAttendConfirmPass()
          $("#user_password_confirmation").parent().children('.attend-pass-confirm').remove()
          $("#user_password_confirmation").parent().append(html)
        }
      }else{
        pass = true
        confirm = true
      }
      
    if(!noBot){
      function buildHtmlAttendSelect(){
        var htmlAttendSelect = `<p class='attend-select'>選択してください</p>`
        return htmlAttendSelect
      }
      $('.g-recaptcha').children('.attend-select').remove()
      $('.g-recaptcha').append(buildHtmlAttendSelect)
      $('.single-contents__form__recaptcha').css('border', '1px solid #ea352d')
    }
    if(nul == true || type == false || noBot == false || pass == false || confirm == false){
      $("html,body").animate({scrollTop:0});
    }else{
      $('#form-first').hide();
      $('#form-second').show();
      $('.signup__radius2').addClass('signup__header__nav__red')
      $('.signup__header__nav__box__li__bottom__first').css('background-color', 'red')
      $("#form-second .single-contents__form__content:first").find(".single-contents__form__content__lower__field").focus()
      $("html,body").animate({scrollTop:0});
    }
  })
  //form-second
  $('#submit-form-second').on('click', function(e){
    e.preventDefault();
    //validate presence
    var nul;
    $('#form-second :required').each(function(){
      if($(this).val() == ""){
        nul = true;
        var label = $(this).parent().siblings('.single-contents__form__content__upper').children('label').text()
        var html = buildHtmlAttendNull(label)
        $(this).siblings('.attend-null').remove()
        $(this).parent().append(html)
      }else{
        nul = false;
      }
    })
    //validate check-phone-number
    var type;
    if ($("#user_user_information_attributes_check_phone_number").val().match(/^(070|080|090)\d{8}$/)){
      type = true
    }else{
      type = false
      var html = buildHtmlAttendTypeError()
      $("#user_user_information_attributes_check_phone_number").parent().children('.attend-type-error').remove()
      $("#user_user_information_attributes_check_phone_number").parent().append(html)
    }
    if(nul == true || type == false){
      $("html,body").animate({scrollTop:0});
    }else{
      $('#form-second').hide();
      $('#form-third').show();
      $('.signup__radius3').addClass('signup__header__nav__red')
      $('.signup__header__nav__box__li__bottom__second').css('background-color', 'red')
      $("#form-third .single-contents__form__content:first").find(".single-contents__form__content__lower__field").eq(0).focus()
      $("html,body").animate({scrollTop:0});
    }
  })
  //form-third
  $('#submit-form-third').on('click', function(e){
    e.preventDefault();
    //validate presence
    var nul;
    $('#form-third :required').each(function(){
      if($(this).val() == ""){
        nul = true;
        var label = $(this).parent().siblings('.single-contents__form__content__upper').children('label').text()
        var html = buildHtmlAttendNull(label)
        $(this).siblings('.attend-null').remove()
        $(this).parent().append(html)
      }else{
        nul = false;
      }
    })
    //validate postal-code
    var type;
    if ($("#user_user_address_attributes_postal_code").val().match(/^\d{3}-\d{4}$/)){
      type = true
    }else{
      type = false
      var html = buildHtmlAttendTypeError()
      $("#user_user_address_attributes_postal_code").parent().children('.attend-type-error').remove()
      $("#user_user_address_attributes_postal_code").parent().append(html)
    }
    if(nul == true || type == false){
      $("html,body").animate({scrollTop:0});
    }else{
      $('#form-third').hide();
      $('#form-forth').show();
      $('.signup__radius4').addClass('signup__header__nav__red')
      $('.signup__header__nav__box__li__bottom__third').css('background-color', 'red')
      $("#form-forth .single-contents__form__content:first").find(".single-contents__form__content__lower__field").focus()
      $("html,body").animate({scrollTop:0});
    }
  })
  //form-forth
  $('#submit-form-forth').on('click', function(e){
    e.preventDefault();
    //validate presence
    var nul;
    $('#form-forth :required').each(function(){
      if($(this).val() == ""){
        nul = true;
        var label = $(this).parent().siblings('.single-contents__form__content__upper').children('label').text()
        var html = buildHtmlAttendNull(label)
        $(this).siblings('.attend-null').remove()
        $(this).parent().append(html)
      }else{
        nul = false;
      }
    })
    //validate card-number
    var typeCardNumber;
    if ($(".new_card_number").val().match(/^\d{16}$/)){
      typeCardNumber = true
    }else{
      typeCardNumber = false
      var html = buildHtmlAttendTypeError()
      $(".new_card_number").parent().children('.attend-type-error').remove()
      $(".new_card_number").parent().append(html)
    }
    //validate security-code
    var typeSecurityCode;
    if ($(".new_security_code").val().match(/^\d{3,4}$/)){
      typeSecurityCode = true
    }else{
      typeSecurityCode = false
      var html = buildHtmlAttendTypeError()
      $(".new_security_code").parent().children('.attend-type-error').remove()
      $(".new_security_code").parent().append(html)
    }
    if(nul == true ||typeCardNumber == false || typeSecurityCode == false){
      $("html,body").animate({scrollTop:0});
    }else{
      var form = $(".single-contents__form"),
          number = form.find('input[name="card_number"]'),
          cvc = form.find('input[name="security_code"]'),
          exp_month = form.find('input[name="expiration_month"]'),
          exp_year = form.find('input[name="expiration_year"]');
      Payjp.setPublicKey('pk_test_1fc85b9008fbb18d92cb8f0b');

      var card = {
        number: number.val(),
        cvc: cvc.val(),
        exp_month: exp_month.val(),
        exp_year: '20' + exp_year.val()
      };

      Payjp.createToken(card, function(s, response) {
        if (response.error) {
          $(".new_security_code").parent().children('.attend-type-error').remove()
          $(".new_security_code").parent().append(`<p class='attend-type-error'>カード情報が間違っています</p>`)
        } else {
          $(".number").removeAttr("name");
          $(".cvc").removeAttr("name");
          $(".exp_month").removeAttr("name");
          $(".exp_year").removeAttr("name");

          var token = response.id;

          form.append($('<input type="hidden" name="user[user_card_attributes][customer_id]" />').val(token));
          form.get(0).submit();
        }
      });
    }
  })

//validate presence
  function buildHtmlAttendNull(label){
    var htmlAttendNull = `<p class='attend-null'>${label}を入力してください</p>`
    return htmlAttendNull
  }

  $(".single-contents__form :required").on('focusout', function(){
    $(this).siblings('.attend-null').remove()
    var value = $(this).val()
    if (value == "" || value == prompt){
      console.log(value)
      var label = $(this).parent().siblings('.single-contents__form__content__upper').children('label').text()
      var html = buildHtmlAttendNull(label)
      $(this).parent().append(html)
    }else{
      
    }
  })

//validate type email
  function buildHtmlAttendTypeError(){
    var htmlAttendTypeError = `<p class='attend-type-error'>フォーマットが不適切です</p>`
    return htmlAttendTypeError
  }

  $("#user_email").on('focusout', function(){
    $(this).parent().children('.attend-type-error').remove()
    var value = $(this).val()
    if(value == ""){
    }else if (value.match(/^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/)){
      
    }else{
      var html = buildHtmlAttendTypeError()
      $(this).parent().append(html)
    }
  })

//validate type password
  function buildHtmlAttendPass(){
    var htmlAttendPass = `<p class='attend-pass'>パスワードは6文字以上128文字以下で入力してください</p>`
    return htmlAttendPass
  }
  $("#user_password").on('focusout', function(){
    $(this).parent().children('.attend-pass').remove()
    var value = $(this).val()
    if(value.match(/^[A-Za-z0-9]{6,128}$/)){
      
    }else{
      var html = buildHtmlAttendPass()
      $(this).parent().append(html)
    }
  })
//validate confirm password
function buildHtmlAttendConfirmPass(){
  var htmlAttendPass = `<p class='attend-pass-confirm'>パスワードとパスワード(確認)が一致しません</p>`
  return htmlAttendPass
}
$("#user_password_confirmation").on('focusout', function(){
  $(this).parent().children('.attend-pass-confirm').remove()
  var value = $(this).val()
  if(value.match($("#user_password").val())){
    
  }else{
    var html = buildHtmlAttendConfirmPass()
    $(this).parent().append(html)
  }
})

//validate type kana
  function buildHtmlAttendKana(label){
    var htmlAttendKana = `<p class='attend-kana'>${label}はカナ文字で入力してください</p>`
    return htmlAttendKana
  }
  $(".kana").on('focusout', function(){
    $(this).parent().children('.attend-kana').remove()
    if(value == ""){
    var value = $(this).children().val()
    }else if (value.match(/^[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+$/)){
      
    }else{
      var label = $(this).siblings('.single-contents__form__content__upper').children('.single-contents__form__content__upper__label').text()
      var html = buildHtmlAttendKana(label)
      $(this).append(html)
    }
  })
  //validate type check_phone_number
  $("#user_user_information_attributes_check_phone_number").on('focusout', function(){
    $(this).parent().children('.attend-type-error').remove()
    var value = $(this).val()
    if(value == ""){

    }else if (value.match(/^(070|080|090)\d{8}$/)){
      
    }else{
      var html = buildHtmlAttendTypeError()
      $(this).parent().append(html)
    }
  })
  //validate type postal-code
  $("#user_user_address_attributes_postal_code").on('focusout', function(){
    $(this).parent().children('.attend-type-error').remove()
    var value = $(this).val()
    if(value == ""){

    }else if (value.match(/^\d{3}-\d{4}$/)){
      
    }else{
      var html = buildHtmlAttendTypeError()
      $(this).parent().append(html)
    }
  })
  //validate type card-number
  $("#user_user_card_attributes_card_number").on('focusout', function(){
    $(this).parent().children('.attend-type-error').remove()
    var value = $(this).val()
    if(value == ""){

    }else if (value.match(/^\d{16}$/)){
      
    }else{
      var html = buildHtmlAttendTypeError()
      $(this).parent().append(html)
    }
  })
    //validate type security-code
  $("#user_user_card_attributes_security-code").on('focusout', function(){
    $(this).parent().children('.attend-type-error').remove()
    var value = $(this).val()
    if(value == ""){

    }else if (value.match(/^\d{3,4}$/)){
    
    }else{
      var html = buildHtmlAttendTypeError()
      $(this).parent().append(html)
    }
  })
  if($('.single-contents__advertisement').length){
    $('.signup__radius2').addClass('signup__header__nav__red')
    $('.signup__header__nav__box__li__bottom__first').css('background-color', 'red')
    $('.signup__radius3').addClass('signup__header__nav__red')
    $('.signup__header__nav__box__li__bottom__second').css('background-color', 'red')
    $('.signup__radius4').addClass('signup__header__nav__red')
    $('.signup__header__nav__box__li__bottom__third').css('background-color', 'red')
    $('.signup__radius5').addClass('signup__header__nav__red')
    $('.signup__header__nav__box__li__bottom__forth').css('background-color', 'red')
    $('.signup__header__nav__box__li__bottom__end').css('background-color', 'red')
  }
})