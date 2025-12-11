<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>

<style>
    .page-header {
        font-weight: 700;
        color: #ff7043;
    }
    .panel-heading {
        background-color: #ff7043 !important;
        font-weight: bold;
        color: white !important;
    }
    .recipe-btn {
        background-color: #ffe0b2;
        color: black;
        border: none;
    }
    .recipe-btn:hover {
        background-color: #f4511e;
        color: #fff;
    }
</style>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">🍳 자취생 요리 레시피 공유 게시판</h1>
            <p class="text-muted">간단하고 맛있는 레시피를 공유해 보세요!</p>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    자취생 레시피 목록

                    <!-- 메인으로 이동 버튼 -->
                    <button class="btn btn-xs pull-right recipe-btn" 
                            style="margin-left:5px;"
                            onclick="self.location='/board/main'">
                        🏠 메인으로
                    </button>

                    <!-- 새 레시피 등록 버튼 -->
                    <button class="btn btn-xs pull-right recipe-btn" 
                            onclick="self.location='/board/register'">
                        + 새로운 레시피 등록
                    </button>

                </div>

                <div class="panel-body">
                    <table width="100%" class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>레시피 제목</th>
                                <th>작성자</th>
                                <th>등록일</th>
                                <th>수정일</th>
                                <th>좋아요</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="board" items="${list}">
                                <tr>
                                    <td><c:out value="${board.bno}" /></td>
                                    <td>
                                        <a href="/board/get?bno=${board.bno}">
                                            🍽 <c:out value="${board.title}" />
                                        </a>
                                    </td>
                                    <td><c:out value="${board.writer}" /></td>
                                    <td class="center">
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" />
                                    </td>
                                    <td class="center">
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}" />
                                    </td>
                                    <td class="center">
                                        <!-- 좋아요 버튼 (폼 방식) -->
                                        <form action="/board/like" method="post" style="display:inline;">
                                            <input type="hidden" name="bno" value="${board.bno}">
                                            <input type="hidden" name="page" value="${page}">
                                            <button type="submit" class="btn btn-xs recipe-btn">
                                                👍 ${board.likes}
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- 페이징 -->
                    <div class="text-center">
                        <c:forEach var="i" begin="1" end="${totalCount / size + 1}">
                            <a href="/board/list?page=${i}" class="btn btn-xs recipe-btn">${i}</a>
                        </c:forEach>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <div class="modal-content">
      <div class="modal-header" style="background:#ffccbc;">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">알림</h4>
      </div>
      <div class="modal-body">
        <p>처리되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn recipe-btn" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';

		checkModal(result);

		function checkModal(result){
			if(result === '') return;

			if(result === 'registered'){
				$(".modal-title").html("레시피 등록 완료");
				$(".modal-body").html("새로운 레시피가 공유되었습니다! 🍳");
				$("#myModal").modal("show");
			}else if(result === 'modified'){
				$(".modal-title").html("레시피 수정 완료");
				$(".modal-body").html("레시피 내용이 성공적으로 수정되었습니다!");
				$("#myModal").modal("show");
			}
		}
	});
</script>

<%@ include file="../includes/footer.jsp" %>
