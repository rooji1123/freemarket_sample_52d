$(function () {
  function buildImage(loadedImageUri) {
    var html =
      `<li>
    <img src=${loadedImageUri}>
    <div class="item__images__container__preview__box">
      <div class="item__images__container__preview__box__edit" >
        編集
      </div>
      <div>
        <a class="item__images__container__preview__box__delete">削除</a>
      </div>
    </div>
  </li>`
    return html
  };
  var files_array = [];
  $('.item__images__container__guide').on('dragover', function (e) {
    e.preventDefault();
  });
  $('.item__images__container__guide').on('drop', function (event) {
    event.preventDefault();
    files = event.originalEvent.dataTransfer.files;
    for (var i = 0; i < files.length; i++) {
      files_array.push(files[i]);
      var fileReader = new FileReader();
      fileReader.onload = function (event) {
        var loadedImageUri = event.target.result;
        $(buildImage(loadedImageUri)).appendTo(".item__images__container__preview ul").trigger("create");
      };
      fileReader.readAsDataURL(files[i]);
    }
  });
  $(document).on('click', '.item__images__container__preview a', function () {
    var index = $(".item__images__container__preview a").index(this);
    files_array.splice(index - 1, 1);
    $(this).parent().parent().parent().remove();
  });

  $('#new_item').on('submit', function (e) {
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    files_array.forEach(function (file) {
      formData.append("item_images[images][]", file)
    });
    $.ajax({
      url: '/items',
      type: "POST",
      data: formData,
      contentType: false,
      processData: false,
      dataType: 'json',
    })
      .done(function (data) {
        alert('出品に成功しました！');
      })
      .fail(function (XMLHttpRequest, textStatus, errorThrown) {
        alert('出品に失敗しました！');
      });
  });
});