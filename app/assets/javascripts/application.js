//= require rails-ujs
//= require_tree .


$('#booking_date_start').on('change', function(e) {
  var dateBegin = $('#booking_date_start')[0].value;
  $('#booking_date_end')[0].value = dateBegin;
  var dateFin = $('#booking_date_end')[0].value;
  var begin = dateBegin.split("-");
  var dateBegin = new Date(begin[2],begin[1]-1,begin[0])
  var fin = dateFin.split("-");
  var dateFin = new Date(fin[2],fin[1]-1,fin[0])
  var price = document.getElementById('price').innerText;
  var price = Number(price);
  calculPrice(dateBegin,dateFin,price)
});

$('#booking_date_end').on('change', function(e) {
  var dateBegin = $('#booking_date_start')[0].value;
  var dateFin = $('#booking_date_end')[0].value;
  var begin = dateBegin.split("-");
  var dateBegin = new Date(begin[2],begin[1]-1,begin[0])
  var fin = dateFin.split("-");
  var dateFin = new Date(fin[2],fin[1]-1,fin[0])
  var price = document.getElementById('price').innerText;
  var price = Number(price);
  calculPrice(dateBegin,dateFin,price)
});

// document.addEventListener('change', (e) => {
//   console.log(e);
// }):

function calculPrice(dateBegin,dateFin, price){
  var d4 = new Number((dateFin - dateBegin)/ 86400000) + 1;
  console.log(d4)
  var pricing = d4 * price;
  console.log('pricing :' + pricing);
  document.getElementById('totalo').innerText = (Math.round(pricing)).toString() + " €" ;
}
// $('#booking_date_start').off()
