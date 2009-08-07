var $j = jQuery.noConflict();

var MoneyRail = MoneyRail || {};

MoneyRail.create_row_number = function(){
  return (++MoneyRail.last_row_number);
};

MoneyRail.insert_row = function(n){
  var make_tds = function(k){
    return $R(1, k).map(function(i){
      return [
        "<td><input type='text'></td>",
        "<td class='number'><input type='text'></td>"
      ];
    });
  };

  var new_row_number = MoneyRail.create_row_number();
  $j("#row"+n).after([
    "<tr id='row", new_row_number, "'>",
      // Button
      "<td class='inserts'>",
        "<span class='pushable'",
              "onclick='MoneyRail.insert_row(", new_row_number, ")'>",
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
  var register_input_updated = function(){
    $j.each($j("input"), function(input){
      $j(input).change(function(e){
        MoneyRail.on_input_changed(e);
      });
    });
  };
  register_input_updated();
};

$j(function(){
  MoneyRail.register_events();
});
