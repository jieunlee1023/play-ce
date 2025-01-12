<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<br>
<div class="container" id="store-update">
	<c:if test="${store.user.id eq principal.user.id}">
		<div id="view-more-title">
			<div>🌟 매장 관리</div>
		</div>
		<span style="color: black">: 이용자에게 보는 가게의 화면 입니다.</span>
		<span style="color: black">아래 수정버튼을 눌러 정보나 이미지를 변경해보세요!</span>
	</c:if>
	<hr>
</div>
<br>

<div class="container">
	<c:choose>
		<c:when test="${empty store}">
			<br>
			<div class="container d-flex">
				<h1 class="" style="font-weight: bold;">엥.. 관리자에게 문의해주세요.</h1>
			</div>
		</c:when>
		<c:otherwise>
			<div class=" justify-content-center ">

				<div>
					<div class="d-flex" style="align-items: flex-end;">
						<c:choose>
							<c:when test="${store.category.id eq 'PC방' }">
								<h1 class="" style="font-weight: bold;">💻
									${store.storeName}</h1>
							</c:when>
							<c:when test="${store.category.id eq '노래방' }">
								<h1 class="" style="font-weight: bold;">🎤
									${store.storeName}</h1>
							</c:when>
							<c:when test="${store.category.id eq '동전노래방' }">
								<h1 class="" style="font-weight: bold;">🎵
									${store.storeName}</h1>
							</c:when>
							<c:when test="${store.category.id eq '당구장' }">
								<h1 class="" style="font-weight: bold;">🎱
									${store.storeName}</h1>
							</c:when>
							<c:when test="${store.category.id eq '볼링장' }">
								<h1 class="" style="font-weight: bold;">🎳
									${store.storeName}</h1>
							</c:when>
							<c:when test="${store.category.id eq '스크린야구장' }">
								<h1 class="" style="font-weight: bold;">⚾
									${store.storeName}</h1>
							</c:when>

						</c:choose>


						<input type="hidden" value="${likeStoresEntity.id }"
							id="likeStoreId">
						<c:choose>
							<c:when
								test="${likeStoresEntity.likeStore eq false || empty likeStoresEntity}">
								<button type="button" id="store--wish--emptyheart"
									data-toggle="tooltip" data-placement="right"
									title="하트를 클릭하여 위시리스트를 등록해보세요!" data-like-btn='emptyHeartBtn'>♡</button>
							</c:when>
							<c:otherwise>
								<button type="button" id="store--wish--heart"
									data-like-btn='heartBtn'>♥</button>
							</c:otherwise>
						</c:choose>

						<input type="hidden" value="${store.id }" id="storeId">
						<c:if test="${store.user.id eq principal.user.id}">
							<div class="store-detail-update">
								<a href="/care-store/update/${store.id}">수정하기</a>
							</div>
						</c:if>
					</div>
				</div>


				<c:choose>
					<c:when test="${empty store.storeTEL}">
						<p class="store-detail-tel">📞 : 현재 가게 연락처는 등록 되지 않았어요 ㅠㅠ</p>
					</c:when>
					<c:otherwise>
						<p class="store-detail-tel">📞 : ${store.storeTEL}</p>
					</c:otherwise>
				</c:choose>

				<a class="" id="kakaotalk-sharing-btn" href="javascript:;"> <img
					src="/image/kakao.png" alt="카카오톡 공유 보내기 버튼" width="200px" />
				</a> <br>
				<br>
				<br>
				<form action="/reservation/${store.id}" method="post"
					id="doReservation">
					<div class="justify-content-center">
						<div class="d-flex justify-content-center">
							<div>
								<input type="date" name="startDate" id="startDate"
									value="2023-02-09" min="2023-02-09" max="${maxDate}">
							</div>
							<div>
								<input type="date" name="endDate" id="endDate"
									value="2023-02-09" min="2023-02-09" max="${maxDate}">
							</div>
							<div>
								<input type="text" class="timepicker" name="startTime"
									id="startTime" value="${nowTime}" min="${nowTime}">
							</div>
							<div>
								<input type="text" class="timepicker" name="endTime"
									id="endTime" value="${nowTimeOnlyHour}"
									min="${nowTimeOnlyHour}">
							</div>
							<input type="hidden" id="storeId" value="${store.id }">
							<button type="submit" id="btn--time-check">예약 하기</button>
						</div>
						<br> <br>
						<c:choose>
							<c:when test="${store.category.id eq 'PC방' }">
								<%@ include file="../layout/pc-room.jsp"%>
							</c:when>
							<c:when test="${store.category.id eq '노래방' }">
								<%@ include file="../layout/singing-room.jsp"%>
							</c:when>
							<c:when test="${store.category.id eq '당구장' }">
								<%@ include file="../layout/billiard-room.jsp"%>
							</c:when>
							<c:when test="${store.category.id eq '동전노래방' }">
								<%@ include file="../layout/coin-singing-room.jsp"%>
							</c:when>
							<c:when test="${store.category.id eq '볼링장' }">
								<%@ include file="../layout/bowling-club.jsp"%>
							</c:when>
							<c:when test="${store.category.id eq '스크린야구장' }">
								<%@ include file="../layout/screen-ballpark.jsp"%>
							</c:when>
						</c:choose>

						<br>
						<div class="d-flex justify-content-center">
							<c:forEach var="image" items="${images}">
								<c:if test="${image.store.id eq store.id }">

									<div class="store-detail-main-img">
										<img src="http://localhost:7777/storeImage/${image.imageUrl}"
											alt="가게 사진" id="store-detail-img">

									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</form>
			</div>
			<div class="">
				<div class="d-flex  justify-content-center">
					<div class="d-flex mr-4 mt-5 ">
						<p>📍 위치 : ${store.storeAddress}</p>
					</div>

					<input type="hidden" value="${store.storeAddress}"
						id="store-address"> <input type="hidden"
						value="${store.storeName}" id="store-name">
				</div>
				<div class="d-flex justify-content-center">
					<div id="map"
						style="width: 80%; height: 300px; justify-content: center"></div>
				</div>
			</div>

		</c:otherwise>
	</c:choose>

</div>


<br>
<br>
<div class="container">
	<h4 id="test style"
		onclick="
		if(plain.style.display=='none') {
		 plain.style.display=''; test.innerText = '✍ 리뷰 접기'
		 } else {
			 plain.style.display = 'none';
			test.innerText = '✍ 리뷰 보기'
		}">
		✍ 리뷰 보기</h4>
	<hr>
</div>
<div class="container" id="plain" style="display: none">

	<div class="d-flex flex-column pr-2 pl-2" style="background-color:">

		<c:forEach var="review" items="${reviewList }">
			<div class="m-3">

				<div class="mb-2" id="" style="background-color:; width: 10%;">
					<img alt="프로필" src="/image/profile.png"
						style="width: 50%; border-radius: 50%">
				</div>
				<div class="mb-2" style="background-color:">
					<div class="mb-2">
						<c:choose>
							<c:when test="${review.starScore eq '1' }">⭐</c:when>
							<c:when test="${review.starScore eq '2' }">⭐⭐</c:when>
							<c:when test="${review.starScore eq '3' }">⭐⭐⭐</c:when>
							<c:when test="${review.starScore eq '4' }">⭐⭐⭐⭐</c:when>
							<c:when test="${review.starScore eq '5' }">⭐⭐⭐⭐⭐</c:when>
						</c:choose>
					</div>
					<div class="mb-2">
						<p>${review.user.username}님</p>
					</div>
					<hr>
				</div>
				<div class="mb-2">
					<p>${review.content}</p>
				</div>
				<hr>
			</div>
		</c:forEach>
	</div>
</div>

<br>
<br>
<br>
<script type="text/javascript" src="/js/reservation.js"></script>
<script type="text/javascript">
	$('document').ready(function() {
		$('#startTime').timepicker({
			timeFormat : 'HH:mm',
			interval : 10,
			startTime : '${nowTime}',
			dynamic : false,
			dropdown : true,
			scrollbar : true,

			change : function(time) {
				var element = $(this), text;
				var timepicker = element.timepicker();
				text = timepicker.format(time);
				timeCheck();
			}
		});
		$('#endTime').timepicker({
			timeFormat : 'HH:mm',
			interval : 10,
			startTime : '${nowTime}',
			dynamic : false,
			dropdown : true,
			scrollbar : true,

			change : function(time) {
				var element = $(this), text;
				var timepicker = element.timepicker();
				text = timepicker.format(time);
				timeCheck();
			}
		});
	});

	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	});

	$(this).ready(function() {
		timeCheck();
		reservationIndex.addMap('${store.storeAddress}', '${store.storeName}');
	})
</script>
<script>
	let image = $("#store-detail-img").attr("src");
	Kakao.Share
			.createDefaultButton({
				container : '#kakaotalk-sharing-btn',
				objectType : 'location',
				address : `${store.storeAddress}`,
				addressTitle : `${store.storeName}`,
				content : {
					title : `Click Go - ${store.storeName}`,
					description : `최고의 인기를 끄는 ${store.storeName}`,
					imageUrl : image,
					link : {
						mobileWebUrl : 'http://localhost:7777',
						webUrl : 'http://localhost:7777',
					},
				},
				social : {
					likeCount : 286,
					commentCount : 45,
					sharedCount : 845,
				},
				buttons : [
						{
							title : '웹으로 보기',
							link : {
								mobileWebUrl : `http://localhost:7777/store/detail/${store.id}`,
								webUrl : `http://localhost:7777/store/detail/${store.id}`,
							},
						}, ],
			});
</script>
<script type="text/javascript" src="/js/reservation.js"></script>
<script type="text/javascript" src="/js/wish-list.js"></script>
<%@ include file="../layout/footer.jsp"%>