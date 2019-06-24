$(function(){
  console.log("active")
  //hide and show views
  $('#submit-form-first').on('click', function(e){
    e.preventDefault();
    $('#form-first').hide();
    $('#form-second').show()
  })
  $('#submit-form-second').on('click', function(e){
    e.preventDefault();
    $('#form-second').hide();
    $('#form-third').show()
  })
  $('#submit-form-third').on('click', function(e){
    e.preventDefault();
    $('#form-third').hide();
    $('#form-forth').show()
  })

//validate presence
  function buildHtmlAttendNull(label){
    var htmlAttendNull = `<p class='attend-null'>${label}を入力してください</p>`
    return htmlAttendNull
  }

  $(".notnull").on('focusout', function(){
    var value = $(this).children().val()
    if (value == ""){
      var label = $(this).siblings('.single-contents__form__content__upper').children('.single-contents__form__content__upper__label').text()
      var html = buildHtmlAttendNull(label)
      $(this).children('.attend-null').remove()
      $(this).append(html)
    }else{
      $(this).children('.attend-null').remove()
    }
  })

//validate type email
  function buildHtmlAttendTypeError(){
    var htmlAttendTypeError = `<p class='attend-type-error'>フォーマットが不適切です</p>`
    return htmlAttendTypeError
  }

  $("#user_email").on('focusout', function(){
    var value = $(this).val()
    console.log(value)
    if(value == ""){
      $(this).parent().children('.attend-type-error').remove()
    }else if (value.match(/^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/)){
      $(this).parent().children('.attend-type-error').remove()
    }else{
      var html = buildHtmlAttendTypeError()
      $(this).parent().children('.attend-type-error').remove()
      $(this).parent().append(html)
    }
  })

//validate type password
  function buildHtmlAttendPass(label){
    var htmlAttendPass = `<p class='attend-pass'>パスワードは6文字以上128文字以下で入力してください</p>`
    return htmlAttendPass
  }
  $("#user_password").on('focusout', function(){
    var value = $(this).val()
    console.log(value)
    if(value.match(/[A-Za-z0-9]{6,128}/)){
      $(this).parent().children('.attend-pass').remove()
    }else{
      var html = buildHtmlAttendPass()
      $(this).parent().children('.attend-pass').remove()
      $(this).parent().append(html)
    }
  })

//validate type kana
  function buildHtmlAttendKana(label){
    var htmlAttendKana = `<p class='attend-kana'>${label}はカナ文字で入力してください</p>`
    return htmlAttendKana
  }
  $(".kana").on('focusout', function(){
    console.log(value)
    if(value == ""){
      $(this).parent().children('.attend-kana').remove()
    var value = $(this).children().val()
    }else if (value.match(/[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/)){
      $(this).children('.attend-kana').remove()
    }else{
      var label = $(this).siblings('.single-contents__form__content__upper').children('.single-contents__form__content__upper__label').text()
      var html = buildHtmlAttendKana(label)
      $(this).children('.attend-kana').remove()
      $(this).append(html)
    }
  })
})