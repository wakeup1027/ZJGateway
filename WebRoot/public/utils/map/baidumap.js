
/** 百度地图自定义插件 v0.1 **/
/** wxw 2014.07.30 **/
(function(window, undefined){

	/** 百度地图 **/
	var baiduMap = {
		map: null,//百度地图实例
		overlays: [],//覆盖物存储器
		setting: {},//百度地图插件自定义的一些变量存储器
		default_level: 15,//默认的地图级别
		
		// 显示覆盖物内容
		showPointInfo: function(addressId, longitudeId, latitudeId, overlay, isUpdate){
			var x = overlay.getPosition().lng;
		 	var y = overlay.getPosition().lat;
		 	var point = new BMap.Point(x, y);
			var myGeo = new BMap.Geocoder();
		   	myGeo.getLocation(point, function(result){
				if (result){
					var address = result.address;
					if(isUpdate === true){
						$("#"+addressId).val(address);
						baiduMap.updateCoordinate(longitudeId, latitudeId, x, y);
					}
					baiduMap.showInfo(address, overlay);
				}
			});
		},
		   
		// 更新坐标
		updateCoordinate: function(longitudeId, latitudeId, x, y){
			$("#"+longitudeId).val(x);
			$("#"+latitudeId).val(y);
		},
		
		// 显示信息
		showInfo: function(address, overlay){
			var pointInfo = '<div style="margin:0;line-height:20px;padding:2px;">' +
				'地址：'+ address +'<br/>' +
				'经度：'+ overlay.getPosition().lng +'<br/>' +
				'纬度：'+ overlay.getPosition().lat +'<br/>' +
				'</div>';
			var infoWindow = new BMap.InfoWindow(pointInfo);  // 创建信息窗口对象
			overlay.openInfoWindow(infoWindow); //开启信息窗口
		},
		
		// 显示信息
		showInfo2: function(json, overlay){
			var infoWindow = new BMap.InfoWindow(json.html);  // 创建信息窗口对象
			overlay.openInfoWindow(infoWindow); //开启信息窗口
		},
		
		clearOther: function(overlay) {
			for(var i = 0; i < baiduMap.overlays.length; i++){
				baiduMap.map.removeOverlay(baiduMap.overlays[i]);
			}
			baiduMap.overlays.length = 0;
			baiduMap.overlays.push(overlay);
		},
		
		// 回调获得覆盖物信息
		overlaycomplete: function(e){
			baiduMap.clearOther(e.overlay);
			baiduMap.showPointInfo(baiduMap.setting.addressId, baiduMap.setting.longitudeId, baiduMap.setting.latitudeId, e.overlay, true);
		},
		
		// 初始化地图
		_init: function(mapDivId, x, y, level){
			var map = new BMap.Map(mapDivId);// 创建地图实例
			var point = new BMap.Point(x, y);// 创建点坐标
			map.centerAndZoom(point, level);// 初始化地图，设置中心点坐标和地图级别
			map.addControl(new BMap.NavigationControl());// 平移缩放控件
			map.addControl(new BMap.ScaleControl());// 比例尺控件
			map.enableScrollWheelZoom();//启用地图滚轮放大缩小
			baiduMap.map = map;
			return point;
		},
		
		// 初始化显示百度地图
		initShowMap: function(setting){
			var level = setting.level;
			if(level == null || level == ""){
				level = baiduMap.default_level;
			}
			var point = baiduMap._init(setting.mapDivId, setting.longitude, setting.latitude, level);
			var marker = new BMap.Marker(point);// 创建标注
			baiduMap.map.addOverlay(marker);// 将标注添加到地图中
			baiduMap.showInfo(setting.address, marker);
			marker.addEventListener("click", function(){
				baiduMap.showInfo(setting.address, this);
			});
		},
		
		// 用于初始显示一个空的地图，默认一个坐标和地图大小的级别
		initMap: function(setting){
			//baiduMap.setting = setting;
			baiduMap._init(setting.mapDivId, setting.longitude, setting.latitude, setting.level);
		},
		
		// 添加一个坐标到地图中
		addMarker: function(setting){
			var marker = new BMap.Marker(new BMap.Point(setting.longitude, setting.latitude));  // 创建标注，为要查询的地方对应的经纬度
			baiduMap.map.addOverlay(marker);// 将标注添加到地图中
			//baiduMap.showInfo(baiduMap.setting.address, marker);
			marker.addEventListener("click", function(){
				baiduMap.showInfo2(setting, this);
			});
		},
		
		// 初始化定位百度地图
		initFixMap: function(setting, longitude_default, latitude_default){
			baiduMap.setting = setting;//{mapDivId: mapDivId, addressId: addressId, longitudeId: longitudeId, latitudeId: latitudeId};
			var longitude = $("#" + baiduMap.setting.longitudeId).val();
			var latitude = $("#" + baiduMap.setting.latitudeId).val();
			var address = $("#" + baiduMap.setting.addressId).val();
			var level = baiduMap.setting.level;
			if(level == null || level == ""){
				level = baiduMap.default_level;
			}
			
			if(longitude != null && longitude != "" && latitude != null && latitude != ""){
				longitude_default = longitude;
				latitude_default = latitude;
			}
			
			var point = baiduMap._init(baiduMap.setting.mapDivId, longitude_default, latitude_default, level);
			
			var marker = new BMap.Marker(point);// 创建标注
			
			//如果有坐标，标记到地图中
			if(longitude != null && longitude != "" && latitude != null && latitude != ""){
				baiduMap.map.addOverlay(marker);// 将标注添加到地图中
				baiduMap.overlays.push(marker);
				if(address == ""){
					baiduMap.showPointInfo(baiduMap.setting.addressId, baiduMap.setting.longitudeId, baiduMap.setting.latitudeId, marker, false);
				}else{
					baiduMap.showInfo(address, marker);
				}
			}
			
			/*
			// 根据坐标得到地址描述
			var myGeo = new BMap.Geocoder();
			myGeo.getLocation(point, function(result){
				if (result){
					$("#" + baiduMap.setting.addressId).val(result.address);
				}
			});
			*/
			
			//实例化鼠标绘制工具
			var drawingManager = new BMapLib.DrawingManager(baiduMap.map, {
				isOpen: true, //是否开启绘制模式
				enableDrawingTool: false //是否显示工具栏
			});
			
			//添加鼠标绘制工具监听事件，用于获取绘制结果
			drawingManager.addEventListener('overlaycomplete', baiduMap.overlaycomplete);
			
			$("#addressSearchBtn").click(function(){
				if($("#address").length == 0 || $("#address").val().length == 0){
					art.dialog.alert("请输入地址！");
				}else{
					var localSearch = new BMap.LocalSearch(baiduMap.map);
					localSearch.enableAutoViewport(); //允许自动调节窗体大小
					
					baiduMap.map.clearOverlays();//清空原来的标注
					var keyword = $("#" + baiduMap.setting.addressId).val();
					localSearch.setSearchCompleteCallback(function (searchResult) {
						var poi = searchResult.getPoi(0);
						baiduMap.map.centerAndZoom(poi.point, level);
						var x = poi.point.lng;
						var y = poi.point.lat;
						var marker = new BMap.Marker(new BMap.Point(x, y));  // 创建标注，为要查询的地方对应的经纬度
						baiduMap.map.addOverlay(marker);
						baiduMap.overlays.push(marker);
						baiduMap.updateCoordinate(baiduMap.setting.longitudeId, baiduMap.setting.latitudeId, x, y);
						baiduMap.showInfo(keyword, marker);
						marker.addEventListener("click", function(){
							baiduMap.showInfo(keyword, this);
						});
						
						drawingManager = new BMapLib.DrawingManager(baiduMap.map, {
							isOpen: true, //是否开启绘制模式
							enableDrawingTool: false //是否显示工具栏
						});
						//添加鼠标绘制工具监听事件，用于获取绘制结果
						drawingManager.addEventListener('overlaycomplete', baiduMap.overlaycomplete);
					});
					localSearch.search(keyword);
				}
			});
		},
		
		// 初始化查询百度地图
		initSearchMap: function(setting){
			baiduMap.setting = setting;
			
			var point = baiduMap._init(baiduMap.setting.mapDivId, baiduMap.setting.longitude, baiduMap.setting.latitude, 11);
			
			$(".ui-carrier").each(function(){
    			var bname =  $(this).attr("bname");
    			var carrier =  $(this).attr("carrier");
    			var longitude =  $(this).attr("longitude");
    			var latitude =  $(this).attr("latitude");
    			if( longitude != null && longitude != '' && latitude != null && latitude != '' ) {
					var marker = new BMap.Marker(new BMap.Point(longitude, latitude));  // 创建标注，为要查询的地方对应的经纬度
					baiduMap.map.addOverlay(marker);
					baiduMap.overlays.push(marker);
					marker.addEventListener("click", function(){
						baiduMap.showInfo(carrier, this);
					});
    			}
				$(this).click(function(){
					var marker = new BMap.Marker(new BMap.Point($(this).attr("longitude"), $(this).attr("latitude")));  // 创建标注，为要查询的地方对应的经纬度
					baiduMap.map.addOverlay(marker);
					baiduMap.showInfo($(this).attr("carrier"), marker);
				});
			});
		}
	};
	
	window.baiduMap = baiduMap;
	
})(window);
