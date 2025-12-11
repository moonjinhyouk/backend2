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
        background-color: #ff7043 !important;
        font-weight: bold;
        color: #e65100;
    }
    .recipe-label {
        color: #e65100;
        font-weight: bold;
    }
    .recipe-btn {
        background-color: #ff7043;
        color: #fff !important;
    }
    .recipe-btn:hover {
        background-color: #f4511e;
        color: #fff !important;
    }
    .danger-btn {
        background-color: #d32f2f;
        color: #fff !important;
    }
    .danger-btn:hover {
        background-color: #b71c1c;
        color: #fff !important;
    }
    .list-btn {
        background-color: #757575;
        color: #fff !important;
    }
    .list-btn:hover {
        background-color: #616161;
        color: #fff !important;
    }
</style>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">🍽 레시피 수정하기</h1>
            <p class="text-muted">자취생 요리 레시피를 더 맛있게 업데이트해 보세요!</p>
        </div>
    </div>

    <!-- content -->
    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    레시피 정보 수정
                </div>

                <div class="panel-body">

                    <form>
                        <div class="form-group">
                           <label class="recipe-label">레시피 번호</label>
                           <input class="form-control" name="bno" value="${board.bno}" readonly>
                        </div>

                        <div class="form-group">
                           <label class="recipe-label">레시피 제목</label>
                           <input class="form-control" name="title" value="${board.title}">
                        </div>

                        <div class="form-group">
                           <label class="recipe-label">레시피 설명</label>
                           <textarea class="form-control" rows="4" name="content">${board.content}</textarea>
                        </div>

                        <div class="form-group">
                           <label class="recipe-label">작성자</label>
                           <input class="form-control" name="writer" value="${board.writer}">
                        </div>

                        <button data-oper="modify" type="submit" class="btn recipe-btn">✔ 수정하기</button>
                        <button data-oper="remove" type="submit" class="btn danger-btn">🗑 삭제하기</button>
                        <button data-oper="list" type="submit" class="btn list-btn">📋 목록으로</button>
                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

</div> <!-- wrapper end -->

<script type="text/javascript">
	$(document).ready(function(){

		$(".btn").click(function(e){
			var myform = $("form");
			var oper = $(this).data("oper");

			if(oper == 'list'){
				e.preventDefault();
				self.location="/board/list";
				return;
			}

			if(oper == 'modify'){
				e.preventDefault();
				myform.attr("method", "post").attr("action", "/board/modify");
				myform.submit();
			}

			if(oper == 'remove'){
				e.preventDefault();
				if(confirm("정말 삭제하시겠습니까?")) {
					myform.attr("method", "post").attr("action", "/board/remove");
					myform.submit();
				}
			}
		});
	});
</script>

<%@ include file="../includes/footer.jsp" %>
