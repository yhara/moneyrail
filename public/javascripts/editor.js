var $j = jQuery.noConflict();

var MoneyRail = MoneyRail || {};

MoneyRail.raise = function(){
  $j.each(arguments, console.error);
};

// refrection
MoneyRail.get_acount_id = function(input){
  var table = $j(input).parents("table");
  if(table.length == 0){
    MoneyRail.raise("table not found:", input);
  }
  return $j(table).attr("title");
};
MoneyRail.get_date_and_position = function(input){
  var tr = $j(input).parents("tr");
  if(tr.length == 0){
    MoneyRail.raise("tr not found:", input);
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

MoneyRail.insert_row = function(elem){
  var make_tds = function(k){
    return $R(1, k).map(function(i){
      return [
        "<td class='title'><input type='text'></td>",
        "<td class='amount'><input type='text'></td>"
      ];
    });
  };

  var a = MoneyRail.get_date_and_position(elem);
  var date = a[0], position = Number(a[1]);
  var row = $j(elem).parents("tr");

  $j(row).after([
    "<tr title='", date, "_", (position+1), "'>",
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
};

// event handlers
MoneyRail.on_input_changed = function(e){
};

MoneyRail.register_events = function(){
  // register input updated
  $j.each($j("input"), function(input){
    $j(input).change(function(e){
      MoneyRail.on_input_changed(e);
    });
  });
  $j("span.pushable").click(function(e){
    MoneyRail.insert_row(e.target);
  });
};

$j(function(){
  MoneyRail.register_events();
});
<!-- この文字列は文字化け除けの文章です -->
