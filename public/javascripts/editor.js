var $j = jQuery.noConflict();

var MoneyRail = MoneyRail || {};

MoneyRail.raise = function(){
  $j.each(arguments, console.error);
};

// refrection
MoneyRail.get_acount_id = function(input_elem){
  var table_elem = $j(input_elem).parents("table");
  if(table_elem.length == 0){
    MoneyRail.raise("table not found:", input_elem);
  }
  return $j(table_elem).attr("title");
};
MoneyRail.get_date_and_position = function(input_elem){
  var tr_elem = $j(input_elem).parents("tr");
  if(tr_elem.length == 0){
    MoneyRail.raise("tr not found:", input_elem);
  }
  var embeded = $j(tr_elem).attr("title");
  return embeded.split(/_/);
};

MoneyRail.insert_row = function(elem){
  var make_tds = function(k){
    return $R(1, k).map(function(i){
      return [
        "<td><input type='text'></td>",
        "<td class='number'><input type='text'></td>"
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
