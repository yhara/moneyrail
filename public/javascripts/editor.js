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

$j(function(){
  //alert("hi");
});
