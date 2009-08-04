var $j = jQuery.noConflict();

var MoneyRail = MoneyRail || {};

MoneyRail.insert_row = function(n){
  var make_tds = function(k){
    return $R(1, k).map(function(i){
      return "<td></td><td></td>";
    }).join("");
  };

  $j("#row"+n).after([
    "<tr>",
    "<td>▽</td>",
    "<td></td>", // Date
    MoneyRail.category_numbers.map(make_tds).join(""),
    "</tr>"
  ].join(""));
};

$j(function(){
  //alert("hi");
});
