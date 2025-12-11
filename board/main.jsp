<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>

<style>
    .main-banner {
        background: linear-gradient(to bottom right, #ff8a65, #ff7043);
        color: white;
        padding: 80px 20px;
        text-align: center;
        border-radius: 10px;
        margin-bottom: 40px;
    }
    .main-banner h1 {
        font-weight: 700;
    }
    .category-btn {
        background-color: #ffe0b2;
        border: none;
        color: #e65100;
        font-weight: bold;
        margin: 5px;
    }
    .category-btn:hover {
        background-color: #ffcc80;
    }
    .recipe-card {
        border: 1px solid #eee;
        border-radius: 8px;
        padding: 15px;
        transition: .2s;
        background: #ffffff;
    }
    .recipe-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    .recipe-title {
        font-size: 18px;
        font-weight: 700;
        color: #ff7043;
    }
</style>

<div id="page-wrapper">

    <!-- 배너 -->
    <div class="main-banner">
        <h1>🍳 자취생 요리 레시피 공유</h1>
        <p>쉽고 빠르고 맛있는 레시피가 모두 여기에!</p>

        <!-- 검색바 -->
        <form action="/board/search" method="get" class="form-inline" style="margin-top:20px;">
            <input type="text" name="keyword" class="form-control" 
                   placeholder="레시피 검색 (예: 계란, 김치볶음)"
                   style="width:300px; border: 2px solid #000; color: #000;">
            <button type="submit" class="btn btn-light" 
                    style="margin-left:5px; color:#000; border:1px solid #000;">
                🔍 검색
            </button>
        </form>

    </div>

    <!-- 카테고리 버튼 -->
    <div class="text-center" style="margin-bottom:40px;">
        <button class="btn category-btn">🍜 한 끼 뚝딱</button>
        <button class="btn category-btn">🥗 다이어트 레시피</button>
        <button class="btn category-btn">🍱 도시락</button>
        <button class="btn category-btn">🧁 간식</button>
        <button class="btn category-btn">🔥 초스피드 요리</button>
    </div>

    <!-- 최신 레시피 / 검색 결과 목록 -->
    <div class="row">
        <div class="col-lg-12">
            <h3>📌 최신 레시피</h3>
            <hr>
        </div>

        <c:forEach var="recipe" items="${list}">
            <div class="col-md-4" style="margin-bottom:30px;">
                <div class="recipe-card">
                    <div class="recipe-title">
                        <!-- 클릭 시 게시글 상세 페이지로 이동 -->
                        <a href="/board/get?bno=${recipe.bno}" style="color:#ff7043;">
                            ${recipe.title}
                        </a>
                    </div>
                    <p style="margin-top:10px; color:#555;">
                        작성자: ${recipe.writer}
                    </p>
                    <p style="font-size:13px; color:#999;">
                        등록일: <fmt:formatDate pattern="yyyy-MM-dd" value="${recipe.regdate}"/>
                    </p>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- 더보기 버튼 -->
    <div class="text-center" style="margin-top:20px;">
        <button class="btn btn-default" onclick="self.location='/board/list'">
            ➕ 모든 레시피 보기
        </button>
    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
