<%@include file="../header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-md-12" style="margin:20px">
        <h2 style="margin:0">Home</h2>
    </div>
    <div class="col-md-12">
        <div id="myajax"></div>
        <button onclick="testMe()">Test</button>
    </div>
</div>

<script type="text/javascript">
    function testMe() {
        $.ajax({
            url: "<c:url value="/home/callme"/>",
            type: "post",
            datatype: "json",
            success: function (data) {
                $("#myajax").html(JSON.stringify(data));
            }
        });
    }
</script>

<%@include file="../footer.jsp" %>
