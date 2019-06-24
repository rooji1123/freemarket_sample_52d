$(function() {
  function appendHTML(brands) {
    $(".sell-form__detail__form-box__brand__select__results").append(`<ul class="brand_search_results"></ul>`)
    brands.forEach(function(brand) {
      var html = `
      <li class="brand_search_results__list" value="${brand.id}">
      ${brand.brand}
      </li>
      `
      $(".brand_search_results").append(html)
    })
  }
  $(document).on("keyup", ".brand__select", function() {
    var input = $(this).val()

    $.ajax({
      type: 'GET',
      url: '/items/brand_search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(brands) {
      $(".sell-form__detail__form-box__brand__select__results").empty();
      brands.length !== 0 ? appendHTML(brands):"";
    })
  })

  $(document).on('click',".brand_search_results__list", function() {
    $(".brand_search_results").remove();
    var name = $(this).text();
    var id = $(this).val();
    $(".brand__select").val(name.replace(/^\s+/g, "").replace(/\s+$/, ""));
    $(".sell-form__detail__form-box__brand__select__results").append(`
    <input type="hidden" name="brand_id" value="${id}">
    `)
  })
})
