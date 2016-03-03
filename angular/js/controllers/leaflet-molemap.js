String.prototype.format = function() {
    var formatted = this;
    for (var i = 0; i < arguments.length; i++) {
        var regexp = new RegExp('\\{'+i+'\\}', 'gi');
        formatted = formatted.replace(regexp, arguments[i]);
    }
    return formatted;
};


app.controller("LayersImageOverlayController", [ "$scope", "$log", "leafletData", "leafletBoundsHelpers", function($scope, $log, leafletData, leafletBoundsHelpers) {
            var maxBounds = leafletBoundsHelpers.createBoundsFromArray([[-272, -350], [272, 350]]);
            var markerCount = 0;
            var html = '<div>Please add tag name: <input ng-model="tagNames.m{0}"/><button ng-click="remove(\'m{0}\')">remove tag</button></div>marker key: m{0}'; //.format(markerCount);

            var mainMarker = {
                lat: 51,
                lng: 0,
                focus: true,
                message: "Hey, drag me if you want",
                draggable: true
            };

            angular.extend($scope, {
                defaults: {
                    dragging: false,
                    doubleClickZoom: false,
                    touchZoom: false,
                    keyboard: false,
                    scrollWheelZoom: false,
                    crs: 'Simple',
                    maxZoom: 0
                },
                center: {
                    lat: 0,
                    lng: 0,
                    zoom: 0
                },
                maxBounds: maxBounds,
                layers: {
                    baselayers: {
                        home: {
                            name: 'Face',
                            type: 'imageOverlay',
                            url: 'img/sse/01.png',
                            bounds: [[-272, -350], [272, 350]],
                            layerParams: {
                                showOnSelector: false,
                                noWrap: true,
                                attribution: 'demo tile'
                            }
                        }
                    },
                },
                markers: {
                    m0: {
                        lat: 0,
                        lng: 0,
                        //message: "I'm a static marker - m" + markerCount,
                        message: html.format(markerCount++),
                        //getMessageScope: function() { return $scope;},
                        icon: {},
                        draggable: true
                    }
                },
                events: { // or just {} //all events
                    markers:{
                      enable: [ 'dragend', 'click' ]
                      //logic: 'emit'
                    }
                }                

            });
            $scope.$on('leafletDirectiveMap.click', function(scope, e) {
                    //console.log(e, pos);
                    var lat = e.leafletEvent.latlng.lat,
                        lng = e.leafletEvent.latlng.lng;
                    //alert("Lat, Lon : " + e.leafletEvent.latlng.lat + ", " + e.leafletEvent.latlng.lng)
                    
                    $scope.markers['m'+markerCount++] = {
                            lat: lat,
                            lng: lng,
                            message: "I'm a static marker - m" + markerCount,
                            //message: html.format(markerCount),
                            getMessageScope: function() { return $scope;},
                            icon: {},
                            draggable: true
                        };
                    
                    
                });            
       }]);