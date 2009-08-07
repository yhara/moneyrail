var $j = jQuery.noConflict();

var MoneyRail = MoneyRail || {};

MoneyRail.insert_row = function(elem){
  var make_tds = function(k){
    return $R(1, k).map(function(i){
      return [
        "<td><input type='text'></td>",
        "<td class='number'><input type='text'></td>"
      ];
    });
  };

  var row = $j(elem).parents("tr");
  var date_str = row.attr("title");

  $j(row).after([
    "<tr title='", date_str, "'>",
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
