<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp" %>

<style>
    /* 페이지 전체 스타일 */
    #page-wrapper {
        padding: 30px !important;
        background: #fafafa;
    }

    /* 헤더 영역 */
    .page-header {
        font-weight: 700;
        color: #ff7043;
        border-bottom: 3px solid #ff7043;
        padding-bottom: 10px;
    }

    /* 패널 디자인 */
    .panel-custom {
        border-radius: 10px;
        border: none;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    .panel-heading-custom {
        background: #ff7043 !important;
        color: white !important;
        font-weight: bold;
        border-radius: 10px 10px 0 0 !important;
        padding: 15px;
        font-size: 16px;
    }

    /* form 요소 스타일 */
    .form-control {
        border-radius: 6px;
        border: 1px solid #ddd;
        box-shadow: none;
    }

    .form-control:focus {
        border-color: #ff7043;
        box-shadow: 0 0 5px rgba(255, 112, 67, 0.5);
    }

    /* 버튼 스타일 */
    .btn-submit {
        background: #ff7043;
        color: white;
        font-weight: bold;
        border-radius: 6px;
        padding: 10px 18px;
    }

    .btn-submit:hover {
        background: #ff5722;
        color: white;
    }

    .btn-reset {
        background: #eee;
        border-radius: 6px;
        padding: 10px 18px;
    }

    .btn-reset:hover {
        background: #ddd;
    }

</style>


<div id="page-wrapper">

    <h1 class="page-header">📝 게시글 등록</h1>

    <div class="panel panel-custom">
        <div class="panel-heading panel-heading-custom">
            ✨ 새 게시글 작성하기
        </div>

        <div class="panel-body">

            <form action="/board/register" method="post">

                <div class="form-group">
                    <label style="font-weight:600;">제목</label>
                    <input class="form-control" name="title" placeholder="글 제목을 입력하세요">
                </div>

                <div class="form-group">
                    <label style="font-weight:600;">내용</label>
                    <textarea class="form-control" rows="5" name="content" placeholder="내용을 입력하세요"></textarea>
                </div>

                <div class="form-group">
                    <label style="font-weight:600;">작성자</label>
                    <input class="form-control" name="writer" placeholder="작성자 이름">
                </div>

                <button type="submit" class="btn btn-submit">등록하기</button>
                <button type="reset" class="btn btn-reset">초기화</button>

            </form>

        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
