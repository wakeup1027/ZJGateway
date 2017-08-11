var map;
var geocoder;    
var infowindow;
var markersArray = [];

function initialize() {
   	geocoder = new google.maps.Geocoder();
	var myOptions = {    
       	zoom : 13,   
		mapTypeId : google.maps.MapTypeId.ROADMAP,
		panControl: true,
		zoomControl: true,
	    mapTypeControl: true,
	    scaleControl: true,
	    streetViewControl: true,
	    overviewMapControl: true
	}
	map = new google.maps.Map( document.getElementById( "map_canvas" ) , myOptions );
	
	var longitude = $("#longitude").val();
	var latitude = $("#latitude").val();
	var address = $("#address").val();
	
	if( longitude == null || longitude == "" )
		longitude = 23.020814096787515;
	if( latitude == null || latitude == "" )
		latitude = 113.12141418457031;
	if( address == null || address == "" )
		address = "北京";
		
	var myLatlng = new google.maps.LatLng( longitude , latitude );
	map.setCenter( myLatlng );
	
	var contentString = "<div id='content'>" + address + "</div>";
	contentString = "";
	infowindow = new google.maps.InfoWindow({
        content: contentString
    });
	var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: '默认地点'
    });
	infowindow.open( map , marker );
	
	google.maps.event.addListener( map , 'click' , function( event ) {
		clearOverlays();
		$("#longitude").val( event.latLng.lat() );
		$("#latitude").val( event.latLng.lng() );
        var marker = new google.maps.Marker({ 
			position: event.latLng,
			map:map
        });
        showAddress(map, marker);
	});
}

function showAddress( map , marker ) {
	markersArray.push( marker );
   	var latlng = marker.getPosition();  
   	var geocoder = new google.maps.Geocoder();  
   	geocoder.geocode({'latLng': latlng}, function(results, status) {  
    	if (status == google.maps.GeocoderStatus.OK) {  
           	if ( results[1] ) {
           		var adds = results[0].formatted_address.split("邮政编码");
           		$("#address").val( adds[0] );
                var address = results[1].formatted_address + "<br />";
                address = results[0].formatted_address + "<br />";
                address += "纬度：" + latlng.lat() + "<br />";
                address += "经度：" + latlng.lng();
               	infowindow.setContent( address );  
               	infowindow.open( map , marker ); 
           	}
       	} else {
        	alert( "请填写正确的地址名称" );
		}
   	});
}

function clearOverlays() {
	if (markersArray) {
		for (i in markersArray) {
			markersArray[i].setMap( null );
		}
 	}
}

function codeAddress() {    
   	var address = document.getElementById( "address" ).value;
       geocoder.geocode({
       	'address' : address
       }, function( results , status ) {    
		if ( status == google.maps.GeocoderStatus.OK ) {    
               map.setCenter( results[0].geometry.location );   
               var marker = new google.maps.Marker({
               	map : map,
                   position : results[0].geometry.location, 
                   title : address,
                   animation : google.maps.Animation.DROP    
			});    
               var display = "地址: " + results[0].formatted_address;  
               var infowindow = new google.maps.InfoWindow({    
               	content : "<span style='font-size:11px'><b>名称: </b>" + address + "<br>" + display + "</span>",    
                   pixelOffset : 0,
                   position : results[0].geometry.location
			});
			
			$("#longitude").val( results[0].geometry.location.lat() );
			$("#latitude").val( results[0].geometry.location.lng() );
               
               infowindow.open( map , marker );
               google.maps.event.addListener( marker , 'click' , function(){    
               	infowindow.open( map , marker );
			});
           } else {
               alert( "请填写正确的地址名称" );
           }
   	});
}