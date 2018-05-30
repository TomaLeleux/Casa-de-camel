function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var searchBar = document.getElementById('camel_address');

    if (searchBar) {
      var autocomplete = new google.maps.places.Autocomplete(searchBar, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(searchBar, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
