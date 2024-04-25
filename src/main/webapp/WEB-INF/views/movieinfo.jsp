<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <%@ include file="include/header-static.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/movieinfo.css">
    <script src="/assets/js/movieinfo.js" defer></script>
    <title>Document</title>
</head>

<body>
<%@ include file="include/header.jsp"%>
<div class="scrollBar"></div>


<div class="movie">
    <div class="info-wrap">
        <img class="poster" src="${movie.imageUrl}">
        <div class="doc">
            <h1>${movie.movieName}</h1>

            <c:if test="${isWish}">
                <svg id="like" data-bon="0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="active">
                    <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path
                            d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z" />
                </svg>
            </c:if>
            <c:if test="${!isWish}">
                <svg id="like" data-bon="0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path
                            d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z" />
                </svg>
            </c:if>

            <p class="content">${movie.plot}</p>
            <div class="info">
                <div>
                    <h1>누적 관객수 :</h1>
                    <p>${movie.audiAcc}명</p>
                </div>
                <div>
                    <h1>장르 : </h1>
                    <p>
                        <c:forEach var="genre" items="${genres}">
                            ${genre.genreName} &nbsp;
                        </c:forEach>
                    </p>
                </div>
                <div>
                    <h1>출연 :</h1>
                    <p>
                        <c:forEach var="actor" items="${actors}">
                            ${actor.actorName} &nbsp;
                        </c:forEach>
                    </p>
                </div>
                <div>
                    <h1>감독 :</h1>
                    <p>${movie.director}</p>
                </div>
                <div>
                    <h1>국가 :</h1>
                    <p>${movie.nation}</p>
                </div>
                <div>
                    <h1>등급 :</h1>
                    <p>${movie.rating}</p>
                </div>
                <div>
                    <h1>개봉일 :</h1>
                    <p>${movie.openDate}</p>
                </div>
                <div>
                    <h1>러닝타임 :</h1>
                    <p>${movie.runtime}분</p>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="review-wrap">
    <div class="review-box">
        <div class="review">
            <!-- 리뷰별개수 창입니다 -->
            <div class="reple">
                <div class="reple-box">
                    <div class="reple-star">
                            <span class="star">
                                ★★★★★
                                <span>★★★★★</span>
                                <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                            </span>
                        <div class="reple-star-bt">
                            <button class="reple-bt" onclick="openModal()"> 후기작성 </button>
                        </div>
                    </div>
                    <div class="reple-item">
                        <select>
                            <option>공감순</option>
                            <option>최신순</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="swiper review-swiper-custom">
                <div class="swiper-wrapper" id="reviewData">

                    <!--
                        renderReviews에서 태그 추가
                    -->

                </div>
                <div class="swiper-pagination pagination_bullet"></div>
                <div class="swiper-pagination pagination_progress"></div>
            </div>
        </div>
    </div>
</div>

<!-- 모달 -->
<div id="reviewModal" class="modal">
    <div class="modal-content">
        <div class="modalbox">
            <div class="box">
                <!-- <div id="pro"><svg id="user" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"> 프로필</div> -->
                <span class="star-modal">
                        ★★★★★
                        <span>★★★★★</span>
                    </span>
                <span class="close" onclick="closeReviewModal()">&times;</span>

            </div>

            <form id="review-form" class="profile">
                <textarea class="text" type="text" id="text" placeholder="리뷰를 작성해주세요"></textarea>
                <div id="reviewContent"></div>
                <div class="register">
                    <input type="submit" id="register" class="first btn" value="등록">
                </div>
            </form>
        </div>
    </div>

</div>


<%@ include file="include/footer.jsp"%>



</body>

</html>