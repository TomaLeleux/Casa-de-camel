
// document.getElementById("booking_date_start_i3").addEventListener("click", (event) => {

// })


function calculPrice(d1, d2, price){
  const d4 = new Number((d2 - d1)/ 86400000);
  const pricing = d4 * price;
  console.log('pricing :' + pricing);
}

export { calculPrice }

// calculPrice(new Date(2018,1,2),new Date(2018,4,5),1)
