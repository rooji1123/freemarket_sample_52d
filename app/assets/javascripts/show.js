$(function(){
  var slider = ".detail__item__info__image-top";
  var thumbnailItem = ".detail__item__info__image-dot";
  
  $(thumbnailItem).each(function(){
   var index = $(thumbnailItem).index(this);
   $(this).attr("data-index",index);
  });

  $(slider).slick({
    arrows: false,
    infinite: false,
    waitForAnimate: false
  });
  $(thumbnailItem).on('mouseover',function(){
    var index = $(this).attr("data-index");
    $(slider).slick("slickGoTo",index,false);
  });
  
});