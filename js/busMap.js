let busMap, busMappingLayer, busVectorLayer, busSelectMarkerControl, selectedBus;

function initBusMap() {
    busMap = new OpenLayers.Map('bus-map');
    busMappingLayer = new OpenLayers.Layer.OSM("Simple OSM busMap");

    busMap.addLayer(busMappingLayer);
    busVectorLayer = new OpenLayers.Layer.Vector("Vector Layer", {projection: "EPSG:4326"});
    busSelectMarkerControl = new OpenLayers.Control.SelectFeature(busVectorLayer, {onSelect: onMapSelect, onUnselect: onPopupUnselect});
    busMap.addControl(busSelectMarkerControl);

    busSelectMarkerControl.activate();
    busMap.addLayer(busVectorLayer);
    busMap.setCenter(
        new OpenLayers.LonLat(0, 0).transform(
            new OpenLayers.Projection("EPSG:4326"),
            busMap.getProjectionObject())
        , 1
    );
}

function placeBus() {
    let longitude = Math.floor((Math.random()*180)-90);
    let latitude = Math.floor((Math.random()*180)-90);
    let coordinates = new OpenLayers.Geometry.Point(longitude, latitude);
    coordinates.transform("EPSG:4326", busMap.getProjectionObject());
    let bus = new OpenLayers.Feature.Vector(coordinates,
            {
                id: 2,
                lastUpdate: Date.now(),
                text: "Autobus n°" + this.id + "\nUltimo aggiornamento: " + this.lastUpdate,
                longitude: longitude,
                latitude: latitude
            }
        );
    busVectorLayer.addFeatures(bus);
}