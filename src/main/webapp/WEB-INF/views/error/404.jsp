<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#mvIndex").click(function () {
                location.href = "/";
            });
        });
    </script>

    <div class="container text-center mt-3">
        <div class="col-lg-8 mx-auto">
            <div class="jumbotron">
                <h1 class="text-danger">요청하신 페이지를 찾을 수 없습니다.</h1>
                <p class="mt-4"><button type="button" id="mvIndex" class="btn btn-outline-dark">메인으로 이동</button>
                </p>
            </div>
        </div>
    </div>
</body>

</html>