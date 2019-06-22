$(function() {
  $('.detail__item__info__image-top').slick({
    arrows: false,
    asNavFor:'.detail__item__info__image-dots'
  });
  $('.detail__item__info__image-dots').slick({
    slidesToShow: 5,
    arrows: false,
    asNavFor:'.detail__item__info__image-top',
    focusOnSelect: true
  });
});