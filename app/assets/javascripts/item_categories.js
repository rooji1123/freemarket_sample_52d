$(function () {
  function buildChild() {
    var html = `<div class="select-warp child-box">
    <select class="select-default" id="children-form" name="item[category_ids][]"><option value="">---</option>
    </select>
    </div>`
    return html;
  }
  function buildChildOption(child) {
    var childOption = `<option value="${child.id}">${child.name}</option>`
    return childOption;
  }
  function buildGrandChild() {
    var html = `<div class="select-warp grandchild-box">
    <select class="select-default" id="grand-children-form" name="item[category_ids][]"><option value="">---</option>
    </select>
    </div>`
    return html;
  }
  function buildGrandChildOption(grandchild) {
    var GrandChildOption = `<option value="${grandchild.id}">${grandchild.name}</option>`
    return GrandChildOption;
  }
  $("#parent-form").on("change", function () {
    var parentValue = document.getElementById("parent-form").value;
    $(".child-box").remove();
    $(".grandchild-box").remove();
    $('.hidden').css({
      'display': 'none'
    });
    $.ajax({
      url: '/items/category_search',
      type: "GET",
      data: {
        parent_id: parentValue
      },
      dataType: 'json'
    })
      .done(function (child) {
        var InsertHTML = '';
        $('#children-form-area').append(buildChild());
        child.forEach(function (child) {
          InsertHTML = buildChildOption(child);
          $('#children-form').append(InsertHTML);
        })
      })
  })
  $(document).on("change", "#children-form", function () {
    var childrenValue = document.getElementById("children-form").value;
    $(".grandchild-box").remove();
    $('.hidden').css({
      'display': 'none'
    });
    $.ajax({
      url: '/items/category_search',
      type: "GET",
      data: {
        child_id: childrenValue
      },
      dataType: 'json'
    })
      .done(function (grandchild) {
        var InsertHTML = '';
        $('#grandchild-form-area').append(buildGrandChild());
        grandchild.forEach(function (grandchild) {
          InsertHTML = buildGrandChildOption(grandchild);
          $('#grand-children-form').append(InsertHTML);
        })
      })
  });
  $(document).on("change", "#grand-children-form", function () {
    $('.sell-form__detail__form-box__size__select').css({
      'display': 'block'
    });
  });
  $(document).on("change", "#grand-children-form", function () {
    $('.sell-form__detail__form-box__size').css({
      'display': 'block'
    });
  });
});