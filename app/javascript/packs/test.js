// selectボックスに変更があれば、カードの内容を変更する
$(document).ready(function() {
  $(document).on('change',"[class^='js_recipe_name']",function(){
    // formをクリックせずsubmitと同じ処理を実行する
    let form_num = this.classList.value.replace(/\D/g,'');
    let form = $("#recipe_name_form_" + form_num).get(0);
    let formData = new FormData( form );
    let recipe_id = $(this).val();
    formData.append('recipe_id',recipe_id);
    formData.append('global',form_num);
    // controllerのcard_updateを実行する
    $.ajax({
      url: "/recipes/card_update",
      dataType: "script",
      type: "post",
      data: formData,
      processData: false,
      contentType: false
    });
  });
});

//formのproduct_timeに変更があれば、変更に応じて他のtimeにも変更を加える
$(document).ready(function() {
  $(document).on('change',"[id^='time']",function(){
    // 最初の値と、変更後の値の変化率を計算
    let time_id = this.id.match(/\d+/)[0];
    let default_time = this.defaultValue;
    let changed_time = this.value;
    seki = changed_time / default_time

    // 「完成物の計算」最初の値から、変化率分変化させる
    var product_time = document.getElementsByClassName("product_time_" + time_id);
    $(".product_time_" + time_id).each(function(index) {
      var new_product_time = product_time[index].getAttribute("default_time") * seki;
      console.log(new_product_time)
      $("#time_" + time_id + "_" + index).val(new_product_time);
    });

    // 「素材の計算」最初の値から、変化率分変化させる
    var material_time = document.getElementsByClassName("material_time_" + time_id);
    $(".material_time_" + time_id).each(function(index) {
      var new_material_time = material_time[index].getAttribute("default_time") * seki;
      console.log(new_material_time)
      $("#material_time_" + time_id + "_" + index).html(new_material_time);
    });
    // 「機械の計算」最初の値から、変化率分変化させる
    var electricity = document.getElementsByClassName("electricity_" + time_id);
    $(".electricity_" + time_id).each(function(index) {
      var new_electricity = electricity[index].getAttribute("default_electricity") * seki;
      console.log(new_electricity)
      $("#electricity_" + time_id).html(new_electricity);
    });
  });
});