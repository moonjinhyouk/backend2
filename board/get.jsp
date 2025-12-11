<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>

<style>
    .page-header {
        color: #ff7043;
        font-weight: 700;
    }
    .panel-heading {
        background-color:  #ff7043 !important;
        font-weight: bold;
        color: #e65100;
        font-size: 16px;
    }
    .recipe-label {
        color: #e65100;
        font-weight: bold;
    }
    .recipe-btn {
        background-color: #ff7043 !important;
        color: #fff !important;
        border: none;
    }
    .recipe-btn:hover {
        background-color: #f4511e !important;
        color: #fff !important;
    }
    .list-btn {
        background-color: #757575 !important;
        color: #fff !important;
    }
    .list-btn:hover {
        background-color: #616161 !important;
        color: #fff !important;
    }
    .panel-body {
        font-size: 15px;
    }
</style>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">🍽 레시피 상세 보기</h1>
            <p class="text-muted">자취생을 위한 간단하고 맛있는 요리 레시피입니다.</p>
        </div>
    </div>

    <!-- content -->
    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    레시피 정보
                </div>

                <div class="panel-body">

                    <form action="/board/modify" method="get">

                        <div class="form-group">
                           <label class="recipe-label">레시피 번호</label>
                           <input class="form-control" name="bno" value="${board.bno}" readonly>
                        </div>

                        <div class="form-group">
                           <label class="recipe-label">레시피 제목</label>
                           <input class="form-control" name="title" value="${board.title}" readonly>
                        </div>

                        <div class="form-group">
                           <label class="recipe-label">레시피 설명</label>
                           <textarea class="form-control" rows="4" name="content" readonly>${board.content}</textarea>
                        </div>

                        <div class="form-group">
                           <label class="recipe-label">작성자</label>
                           <input class="form-control" name="writer" value="${board.writer}" readonly>
                        </div>

                        <button type="submit" class="btn recipe-btn">✏ 수정하기</button>
                        <button type="button" class="btn list-btn" onclick="self.location='/board/list'">
                            📋 목록으로
                        </button>

                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

</div> <!-- wrapper end -->

<%@ include file="../includes/footer.jsp" %>
