<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<c:choose>
	<c:when test="${waitMsg eq 0 }">
			<div class="d-flex justify-content-center">
				<div id="franchise--none">
					<br><br>
					<div>아무런 신청이 들어오지 않았습니다!</div>
					<br><br><br>
				</div>
			</div>
	</c:when>
	<c:otherwise>
		<c:forEach var="msg" items="${message}">
			<c:if test="${msg.state eq 'WAIT' }">
				<input type="hidden" value="${message.size() }" id="msgSize">
				<div class="d-flex justify-content-center m-5">
					<div class="card  " style="width: 800px">
						<input type="hidden"
							value="http://localhost:7777/licence/${msg.licenseImageUrl}"
							id="licenseImageUrl${message.indexOf(msg)}"> <input
							type="hidden"
							value="http://localhost:7777/layout/${msg.layoutImageUrl}"
							id="layoutImageUrl${message.indexOf(msg)}"> <img
							class="card-img "
							src="http://localhost:7777/licence/${msg.licenseImageUrl}"
							alt="사업자 등록증" style="width: 500px;"> <img class="card-img "
							src="http://localhost:7777/layout/${msg.layoutImageUrl}"
							alt="가게 자리 배치도" style="width: 500px;">
						<div class="card-body ">
							<span>사용자ID : </span> <span id="userId${message.indexOf(msg)}">${msg.user.id}</span>
							<br> <span>사용자이름: </span> <span
								id="userName${message.indexOf(msg)}">${msg.user.username}</span>
							<br> <br> <span>신청서 ID: </span> <span
								id="franchiseId${message.indexOf(msg)}">${msg.id}</span> <br>
							<br> <span>카테고리 :</span> <span
								id="category${message.indexOf(msg)}">${msg.category.id}</span> <br>
							<span>가게명 : </span> <span id="storeName${message.indexOf(msg)}">${msg.storeName}</span><br>
							<span>가게번호 : </span> <span id="storeTel${message.indexOf(msg)}">${msg.storeTEL}</span><br>
							<span>가게주소 : </span> <span
								id="storeAddress${message.indexOf(msg)}">${msg.storeAddress}</span><br>
							<span>가게의 총 자리 갯수 : </span> <span
								id="storeTotalRoomCount${message.indexOf(msg)}">${msg.storeTotalRoomCount}</span><br>
							<span>10분당 이용 금액 : </span> <span
								id="price${message.indexOf(msg)}">${msg.price}</span><br> <br>
							<br>
							<button type="button" class="btn btn-danger"
								id="btn--store-franchise-approve-${message.indexOf(msg)}">가맹점
								승인</button>
							<button type="button" class="btn btn-warning"
								id="btn--store-franchise-reject-${message.indexOf(msg)}">가맹점
								거절</button>
						</div>
					</div>
					<br>
				</div>

			</c:if>
		</c:forEach>
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="/js/storeFranchise.js"></script>

<%@ include file="../layout/footer.jsp"%>