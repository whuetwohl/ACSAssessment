//function testClick() {
//    alert('working');
//}

//let map;
//let infowindow;
//let coords = document.getElementById('coords');

//async function initMap() {

//    const { Map } = await google.maps.importLibrary("maps");
//    const { AdvancedMarkerElement, PinElement } = await google.maps.importLibrary(
//        "marker",
//    );
//    const map = new google.maps.Map(document.getElementById("map"), {
//        zoom: 15,
//        center: { lat: 29.808704376220703, lng: -95.37176513671875 },
//        mapId: "DEMO_MAP_ID",
//    });

//    const currentMarker = new AdvancedMarkerElement({
//        map,
//        position: { lat: 37.39094933041195, lng: -122.02503913145092 },
//        gmpDraggable: true,
//        title: "This marker is draggable. Click to remove.",
//    });

//    currentMarker.addListener("click", (event) => {
//        let latLng = event.latLng;
//        //        let lat = latLng.toString().split(',')[0].replace('(', '');
//        //        let lng = latLng.toString().split(',')[1].replace(')', '');
//        //        let coords = lat + " : " + lng;

//        //    infowindow = new google.maps.InfoWindow({

//        //        title: 'test title',
//        //        content: `<div id="content"> 
//        //        <div id="siteNotice"> 
//        //        </div>
//        //        <h1 id="firstHeading" class="firstHeading">Uluru</h1> 
//        //        <div id="bodyContent"> 
//        //        <p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large 
//        //        sandstone rock formation in the southern part of the 
//        //        Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) 
//        //        south west of the nearest large town, Alice Springs; 450&#160;km 
//        //        (280&#160;mi) by road. Kata Tjuta and Uluru are the two major 
//        //        features of the Uluru - Kata Tjuta National Park. Uluru is 
//        //        sacred to the Pitjantjatjara and Yankunytjatjara, the 
//        //        Aboriginal people of the area. It has many springs, waterholes, 
//        //        rock caves and ancient paintings. Uluru is listed as a World 
//        //        Heritage Site.</p>
//        //        <p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194"> 
//        //        https://en.wikipedia.org/w/index.php?title=Uluru</a> 
//        //        (last visited June 22, 2009).</p>
//        //        </div>
//        //        </div>`,
//        //        position: latLng,
//        //    });
//        //    infowindow.open(map);
//    });


//    map.addListener("click", (e) => {

//        //if (infowindow) infowindow.close();
//        debugger;

//        coords.innerHTML = e.latLng;

//        currentMarker.position = e.latLng;
//        currentMarker.map = map;
//        placeMarkerAndPanTo(e.latLng, map);
//        $.ajax({
//            type: "GET",
//            url: "@Url.Action("GetNames")",
//            dataType: "json",
//            success: function (result) {
//                console.log(result);
//            },
//            error: function (req, status, error) {
//                console.log(status)
//            }
//        });
//    });
//}

//function placeMarkerAndPanTo(latLng, map) {
//    map.panTo(latLng);
//}

//initMap();

