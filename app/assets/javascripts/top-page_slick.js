$(function() {
  $('.main__visual__image').slick({
    prevArrow:'<i class="fa fa-angle-left slide-arrow prev-arrow"></i>',
    nextArrow:'<i class="fa fa-angle-right slide-arrow next-arrow"></i>',
    dots: true,
    autoplay: true,
    autoplaySpeed: 4000,
    speed: 800
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});