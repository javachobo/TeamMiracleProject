<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/map.css">
<style type="text/css">
.searchBtn {
  width: 40px;
  height: 30px;
  border: none;
  border-radius: 3px;
  margin: 12px;
  cursor: pointer;
  font-size: 10px;
  background: #eaeaea4f;
}

.tripContainer {
  margin: 10px;
  padding: 10px;
  background-color: #b5c1dc57;
  border-radius: 8px;
}


.draggable.dragging {
  opacity: 0.5;
}
</style>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	$('.my_Child').draggable({ snap: true });
});
</script>
</head>
<body>
	<hr>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<div class="map_wrap">
		<div id="map"
			style="width: 55%; height: 100%; position: relative; overflow: hidden;"></div>
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						<div>
							<button type="button" class="searchBtn" value="12">관광지</button>
							<button type="button" class="searchBtn" value="14">문화시설</button>
							<button type="button" class="searchBtn" value="15">행사/공연/축제</button>
							<!-- <button type="button" class="searchBtn" value="25">여행코스</button> -->
							<button type="button" class="searchBtn" value="28">레포츠</button>
							<!-- <button type="button" class="searchBtn" value="32">숙박</button> -->
							<button type="button" class="searchBtn" value="38">쇼핑</button>
							<button type="button" class="searchBtn" value="39">음식점</button>
						</div>
						<!-- 키워드 : <input type="text" placeholder="검색" id="keyword" size="15"> -->
						<select id="keyword" name="trip_place">
							<option value="">여행지선택</option>
							<option value="서울">서울</option>
							<option value="부산">부산</option>
							<option value="대구">대구</option>
							<option value="인천">인천</option>
							<option value="광주">광주</option>
							<option value="대전">대전</option>
							<option value="울산">울산</option>
							<option value="세종">세종</option>
							<option value="춘천">춘천</option>
							<option value="청주">청주</option>
							<option value="전주">전주</option>
							<option value="안동">안동</option>
							<option value="포항">포항</option>
							<option value="창원">창원</option>
							<option value="진주">진주</option>
							<option value="여수">여수</option>
							<option value="제주">제주</option>
						</select>
						<button type="submit" id="searchBtnId" class="searchBtn" value="">검색하기</button>
					</form>
				</div>
			</div>
			
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>
	<div
		style="display: flex; align-content: space-around; justify-content: center;">
		<div id="my_div"></div>
		<div id="TripContainer">
  		</div>
	</div>

	<script type="text/javascript">
	$(function() {
		
		$(".searchBtn").click(function() {
		
		// 관광지 검색 결과 지우기
		$("#my_div2").empty();
		
		// 관광지 api	키
		let serviceKey = "PsWL%2Ftf5nGQd3uPozFQ6nKgfpXL7p9PmrJ3TiHOWQV%2BSLHFuhy2QwtTdqpY8NvMrcO4vly6SLSFOAD7TadOn9g%3D%3D";
		
			// 키워드 인코딩
		let keyword = encodeURIComponent($("#keyword").val());
		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('여행지를 선택해주세요!');
			return false;
		}
		// 관광정보 타입 {관광지(12),문화시설(14),행사/공연/축제(15),여행코스(25),레포츠(28),숙박(32),쇼핑(38),음식점(39)}
		let contentTypeId = 12;
		contentTypeId = $(this).val();
		// console.log(contentTypeId);
		
		// 관광정보 타입 서치에 심어주기
		$('#searchBtnId').val(contentTypeId);
		
		// 읽기 순서(배열)
		// let arrange = "readcount";
		let arrange = "P";
		
		// console.log(keyword);
		let keywordUrl = "http://apis.data.go.kr/B551011/KorService/searchKeyword?serviceKey=" + serviceKey + "&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=TestApp&_type=json&keyword=" + keyword + "&ContentTypeId=" + contentTypeId + "&arrange=" + arrange;
		// 지역코드 url
		// let areaCodeUrl = "https://apis.data.go.kr/B551011/KorService/areaCode?serviceKey=PsWL%2Ftf5nGQd3uPozFQ6nKgfpXL7p9PmrJ3TiHOWQV%2BSLHFuhy2QwtTdqpY8NvMrcO4vly6SLSFOAD7TadOn9g%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&areaCode=1&_type=json";
		// 숙박 정보
		
		$.ajax(
				{
					url : keywordUrl,
					error : function(request, status, error) {

						alert("status : " + request.status + ", message : "
								+ request.responseText + ", error : " + error);

					}
				}).done(function(msg) {
			 console.log(msg);
			 //console.log(msg.response.body.items.item);	
				callback(msg);
			 /* let ar = msg.response.body.items.item;
			
			// 관광지 검색 결과 div에 뿌려줌
			const element = document.getElementById('my_div2');
				$.each(ar, function(i, obj) {
					element.innerHTML += '<div class="my_divChild">' + obj.title + '</div>'   + '<img style="width:100px;height:50px;" src="' + obj.firstimage + '">'  ;
					// console.log(obj.title);
				});
					// console.log(element);  */
				
		});
				
		
	});
});
	
</script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1950a2b56dd3863d5c5f75c779612745&libraries=services"></script>
	<script>
	
		
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};
		console.log(kakao);
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
a
		// 키워드로 장소를 검색합니다
		//searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('여행지를 선택해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);
				selectCose(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
		
		// 카카오 코스 html에 보여주기
		function selectCose(places) {
			$("#my_div").empty();
			const element = document.getElementById('my_div');
			for (var i = 0; i < places.length; i++) {
				element.innerHTML += '<div class="my_divChild">' + places[i].place_name + '</div>';
				element.className = "my_div";
			}
			return element;
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
			 console.log(places);
			
			
			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div id="info" class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}
		
		// 관광공사 뿌려주기
		function callback(msg) {
			let ar = msg.response.body.items.item;
			
			// 관광지 검색 결과 div에 뿌려줌
			const element = document.getElementById('TripContainer');
				$.each(ar, function(i, obj) {
					element.innerHTML += '<div class="draggable" draggable="true"><div>' + obj.title + '</div>'   + '<img style="width:100px;height:50px;" src="' + obj.firstimage + '"></div>'  ;
					// console.log(obj.title);
				});
					 console.log(element); 
		}
		

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
		
		
		
		const draggables = document.querySelectorAll(".draggable");
		const containers = document.querySelectorAll(".TripContainer");

		draggables.forEach(draggable => {
		  draggable.addEventListener("dragstart", () => {
		    draggable.classList.add("dragging");
		  });

		  draggable.addEventListener("dragend", () => {
		    draggable.classList.remove("dragging");
		  });
		});

		containers.forEach(container => {
		  container.addEventListener("dragover", e => {
		    e.preventDefault();
		    const afterElement = getDragAfterElement(container, e.clientX);
		    const draggable = document.querySelector(".dragging");
		    if (afterElement === undefined) {
		      container.appendChild(draggable);
		    } else {
		      container.insertBefore(draggable, afterElement);
		    }
		  });
		});
		
	</script>
</body>
</html>