var $j = jQuery.noConflict();

var MoneyRail = MoneyRail || {};

MoneyRail.raise = function(){
  if (console) {
    $j.each(arguments, console.error);
  }
  throw arguments[0];
};

// refrection
MoneyRail.get_acount_id = function(input){
  var table = $j(input).parents("table");
  if(table.length == 0){
    MoneyRail.raise("table not found:", input);
  }
  return $j(table).attr("title");
};
MoneyRail.get_date_and_position = function(elem){
  var tr = $j(elem).parents("tr");
  if(tr.length == 0){
    MoneyRail.raise("tr not found:", elem);
  }
  var embeded = $j(tr).attr("title");
  return embeded.split(/_/);
};
MoneyRail.get_category_id = function(input){
  var td = $j(input).parent("td");
  if(td.length == 0){
    MoneyRail.raise("td not found:", input);
  }
  var type = $j(td).attr("class"); // shall be 'title' or 'amount'
  var idx = $j(td).parent().children("td." + type).index(td);
  return MoneyRail.category_ids[idx];
};

MoneyRail.insert_row = function(btn){
  var make_tds = function(k){
    return $R(1, k).map(function(i){
      return [
        "<td class='title'><input type='text'></td>",
        "<td class='amount'><input type='text'></td>"
      ];
    });
  };

  var a = MoneyRail.get_date_and_position(btn);
  var date = a[0], position = Number(a[1]);
  var row = $j(btn).parents("tr");
  var tr_class = ($j(row).attr("class") == "odd") ? "even" : "odd";

  $j(btn).remove();
  $j(row).after([
    "<tr title='", date, "_", (position+1), "' class='", tr_class, "'>",
      // Button
      "<td class='inserts'>",
        "<span class='pushable'>",
          "▽",
        "</span>",
      "</td>",

      // Date
      "<td></td>",

      // Inputs
      MoneyRail.category_numbers.map(make_tds).flatten().join(""),
    "</tr>"
  ].join(""));
  $j(row).next().find("span.pushable").click(MoneyRail.on_row_button_clicked);
};

// ajax

// Sets item[title], item[amount] and authenticity_token
MoneyRail.ajax_data = function(input, _data){
  var data = _data || {};

  if (input) {
    var type = $j(input).parent("td").attr("class");
    if (type == "title" || type == "amount") {
      var key = "item[" + type + "]";
      data[key] = $j(input).val();
    }
    else {
      MoneyRail.raise("unknown type: " + type);
    }
  }

  data["authenticity_token"] = MoneyRail.authenticity_token;
  return data;
};

MoneyRail.destroy_item = function(input, item_id, after){
  var data = MoneyRail.ajax_data(null, {_method: "delete"});

  $j.post(MoneyRail.item_destroy_path(item_id), data, function(result){
    if (result[0] == "ok"){
      $j("td[title='"+item_id+"']").attr("title", "");

      after();
    }
  }, "json");
};

MoneyRail.update_item = function(input, item_id, after){
  var data = MoneyRail.ajax_data(input);

  $j.post(MoneyRail.item_update_path(item_id), data, function(result){
    if (result[0] == "ok") after();
  }, "json");
};

MoneyRail.create_item = function(input, after){
  var a = MoneyRail.get_date_and_position(input);
  var data = MoneyRail.ajax_data(input, {
    "item[date]": a[0],
    "item[position]": a[1],
    "item[account_id]": MoneyRail.get_acount_id(input),
    "item[category_id]": MoneyRail.get_category_id(input),
  });

  $j.post(MoneyRail.item_create_path, data, function(result){
    if (result[0] == "ok"){
      var td = $j(input).parent("td");
      td.attr("title", result[1]);
      if (td.attr("class") == "title"){
        td.next().attr("title", result[1]);
      }
      else {
        td.prev().attr("title", result[1]);
      }
      
      after();
    }
  }, "json");
};

// event handlers
MoneyRail.on_input_changed = function(e){
  var input = e.target;
  var end_highlight = function(){
    new Effect.Highlight(input, {
      startcolor: "#ccffff", endcolor: "#ffffff", restorecolor: "#ffffff"
    }); 
  }
  var is_delete = function(item_id){
    var empty = /^(\s*)$/;
    var title = $j("td[class='title'][title='"+item_id+"'] input").val();
    var amount = $j("td[class='amount'][title='"+item_id+"'] input").val();

    return empty.match(title) && empty.match(amount);
  }

  $j(input).css("background", "#ffff99");

  var item_id = $j(input).parent("td").attr("title");
  if (item_id) {
    if (is_delete(item_id)){
      MoneyRail.destroy_item(input, item_id, end_highlight);
    }
    else {
      MoneyRail.update_item(input, item_id, end_highlight);
    }
  }
  else {
    MoneyRail.create_item(input, end_highlight);
  }
};

MoneyRail.on_row_button_clicked = function(e){
  MoneyRail.insert_row(e.target);
};

MoneyRail.show_all_accounts = function(){
  MoneyRail.n_accounts.times(function(i){
    $j("#account_"+i).show();
  });
};

MoneyRail.show_only_account = function(k){
  MoneyRail.n_accounts.times(function(i){
    $j("#account_"+i)[i==k ? 'show' : 'hide']();
  });
};

// main

MoneyRail.register_events = function(){
  // register input updated
  $j.each($j("input"), function(input){
    $j(input).change(MoneyRail.on_input_changed);
  });
  $j("span.pushable").click(MoneyRail.on_row_button_clicked);
};

$j(function(){
  if(MoneyRail.editable){
    MoneyRail.register_events();
  }
});
<!-- この文字列は文字化け除けの文章です -->
