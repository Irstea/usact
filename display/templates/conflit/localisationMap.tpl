{if $mapDisplay == 1}
<div id="map" class="mapDisplay"></div>
<script>
var earth_radius = 6389125.541;
var zoom = 11;
function getStyle(libelle) {
	libelle = libelle.toString();
	//console.log("libelle : "+libelle);
	var styleRed = new ol.style.Style( { 
		image: new ol.style.Circle({
		    radius: 6,
		    fill: new ol.style.Fill({
		          color: [255, 0, 0, 0.5]
		 	}),
			stroke: new ol.style.Stroke( { 
				color: [255 , 0 , 0 , 1],
				width: 1
			})
		}),
		text: new ol.style.Text( {
			textAlign: 'Left',
			text: libelle,
			textBaseline: 'middle',
			offsetX: 7,
			offsetY: 0,
			font: 'bold 12px Arial',
			/*fill: new ol.style.Fill({ color: 'rgba(255, 0, 0, 0.1)' }),
			stroke : new ol.style.Stroke({ color : 'rgba(255, 0, 0, 1)' })*/
		})
	});
return styleRed;
}


var attribution = new ol.control.Attribution({
  collapsible: false
});

var map = new ol.Map({
  controls: ol.control.defaults({ attribution: false }).extend([attribution]),
  target: 'map',
  view: new ol.View({
  	center: ol.proj.fromLonLat([{$centreX}, {$centreY}]),
    zoom: zoom
  })
});

var layer = new ol.layer.Tile({
  source: new ol.source.OSM()
});
function transform_geometry(element) {
  var current_projection = new ol.proj.Projection({ code: "EPSG:4326" });
  var new_projection = layer.getSource().getProjection();

  element.getGeometry().transform(current_projection, new_projection);
}

map.addLayer(layer);
var coordinates;
var point;
var point_feature;
var features = new Array();
/*
 * Traitement de chaque localisation
 */
// console.log("Début de traitement des localisations");
{section name=lst loop=$localisation}
{if strlen($localisation[lst].wgs84x) > 0 && strlen($localisation[lst].wgs84y) > 0}
coordinates = [{$localisation[lst].wgs84x}, {$localisation[lst].wgs84y}];
 point = new ol.geom.Point(coordinates);
// console.log("Coordonnées : "+coordinates);
// console.log("point :" + point);
 point_feature = new ol.Feature ( {
	geometry: point
});
point_feature.setStyle(getStyle({$localisation[lst].localisation_id}));
//console.log("point_feature : " +point_feature);
features.push ( point_feature) ;
//console.log("features : "+features);

{/if}
{/section}
/*  
 * Fin d'integration des points
 * Affichage de la couche
 */
var layerPoint = new ol.layer.Vector({
  source: new ol.source.Vector( {
    features: features
  })
});
features.forEach(transform_geometry);
map.addLayer(layerPoint);

</script>
{/if}
