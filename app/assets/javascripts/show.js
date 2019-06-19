$(function() {
  $('.detail__item__info__image-top').slick({
    arrows: false,
    asNavFor:'.detail__item__info__image-dots'
  });
  $('.detail__item__info__image-dots').slick({
    row: 2,
    slidesPerRow: 2,
    slidesToShow: 5,
    arrows: false,
    asNavFor:'.detail__item__info__image-top',
    focusOnSelect: true
  });
});