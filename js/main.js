function init() {
    initBusMap();
    placeBus();
}

function sidebarButton() {
    if (!document.getElementById("sidebar").classList.contains('active')) {
        document.getElementById("sidebar").classList.add('active');
        document.getElementById("sidebarIcon").classList.remove('bi-x');
        document.getElementById("sidebarIcon").classList.add('bi-list');
        document.getElementById("content").classList.add('full');
    }
    else {
        document.getElementById("sidebar").classList.remove('active');
        document.getElementById("sidebarIcon").classList.remove('bi-list');
        document.getElementById("sidebarIcon").classList.add('bi-x');
        document.getElementById("content").classList.remove('full');
    }
}

function onMapSelect(feature) {
    selectedBus = feature;
    popup = new OpenLayers.Popup.FramedCloud("tempId", feature.geometry.getBounds().getCenterLonLat(),
        null,
        selectedBus.attributes.text,
        null, true);
    feature.popup = popup;
    busMap.addPopup(popup);
}

function onPopupUnselect(feature) {
    map.removePopup(feature.popup);
    feature.popup.destroy();
    feature.popup = null;
}