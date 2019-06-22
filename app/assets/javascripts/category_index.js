$(function(){
  $(".category-index__body__ul li").each(function(i){
    $(this).attr('id','category_child' + (i+1));
  });
});