var map = L.map('mapid').on('load', onMapLoad).setView([41.400, 2.206], 9);
//map.locate({setView: true, maxZoom: 17});
	
var tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);

//en el clusters almaceno todos los markers
var markers = L.markerClusterGroup();
var data_markers = [];
var kind_foods = [];
var foods = new Set();
var food = [];

/*
	FASE 3.1
		1) Relleno el data_markers con una petición a la api
		2) Añado de forma dinámica en el select los posibles tipos de restaurantes
		3) Llamo a la función para --> render_to_map(data_markers, 'all'); <-- para mostrar restaurantes en el mapa
    */

function onMapLoad() {
    console.log("Mapa cargado");
    $.getJSON('http://localhost/mapa/api/apiRestaurants.php', function(data) {
        data.forEach(function(restaurant) {
            data_markers.push(restaurant);
            kind_foods.push(restaurant.kind_food);
            let food = restaurant.kind_food.split(",");
            food.forEach(function(item) {
                foods.add(item);
            });

        })
        $('#kind_food_selector').append($('<option>').val('all').text("Todos"));
        foods.forEach(function(item) {
            $('#kind_food_selector').append($('<option>').val(item).text(item));
        })

        render_to_map(data_markers, 'all');
    });
}
    
$('#kind_food_selector').on('change', function() {
    console.log(this.value);
    render_to_map(data_markers, this.value);
});
/*
	FASE 3.2
		1) Limpio todos los marcadores
		2) Realizo un bucle para decidir que marcadores cumplen el filtro, y los agregamos al mapa
    */	
function render_to_map(data_markers, filter) {
    markers.clearLayers()
    for (let i = 0; i < data_markers.length; i++) {
        if (data_markers[i].kind_food.includes(filter)) {
            let marker = L.marker([data_markers[i].lat, data_markers[i].lng]);
            marker.addTo(markers);
            marker.bindPopup("<b>" + data_markers[i].name + "</b><br>" + data_markers[i].kind_food + "<br>" + data_markers[i].address).openPopup();

        } else if (filter == 'all') {
            let marker = L.marker([data_markers[i].lat, data_markers[i].lng]);
            marker.addTo(markers);
            marker.bindPopup("<b>" + data_markers[i].name + "</b><br>" + data_markers[i].kind_food + "<br>" + data_markers[i].address).openPopup();
        }
    }
    markers.addTo(map);
}