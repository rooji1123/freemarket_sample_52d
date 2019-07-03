$(function(){
  function point_select(){
    var html = `
    <li class="item__main__point__exist__select__ul__list item__main__point__exist__select__ul__list-all">ポイントを全て使用する</li>
    <li class="item__main__point__exist__select__ul__list item__main__point__exist__select__ul__list-input">使用するポイントを入力する</li>
    `
    return html
  };

  function point_all(use_point) {
    var html = `
    <p class = "item__main__point__exist-gray item__main__point__exist__text">
      <span>${use_point}</span>ポイント使用します
    </p>
    `
    return html
  }

  $(document).on({
    "mouseenter": function() {
      var html = point_select();
      $('.item__main__point__exist__select__ul').append(html);
    },
    "mouseleave": function() {
      $('.item__main__point__exist__select__ul').empty();
    }
  }, '.item__main__point__exist');

  $(document).on('click', '.item__main__point__exist__select__ul__list-all', function() {
    var point = $('.item__main__point__exist').data('point');
    var price = $('.item__main__burden__price__true').val();
    var update_price = (price - point)
    if (update_price < 0) {
      var use_point = ( price )
      var update_price = 0
    } else {
      var use_point = point
    }
    $('.item__main__price__right__span').text(update_price.toLocaleString());
    $('.item__main__point__exist__text').remove();
    $('.item__main__point__exist__select').prepend(point_all(use_point))
    $('.item__main__burden__price__hidden').val(update_price)
    $('.item__main__point__exist__use-point').val(use_point)
  })

  $(document).on('click', '.item__main__point__exist__select__ul__list', function() {
    $('.item__main__point__exist__select__ul').empty();
  })

})
