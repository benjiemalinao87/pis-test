<%@include file="../header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
    <div class="col-md-12" style="margin-top: 20px">
        <div class="pull-right">
            <button class="btn btn-warning" onclick="_create()">Add New</button>
        </div>
        <h2 style="margin: 0 0 20px 0">List of Person</h2>
    </div>
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Last Name</th>
                        <th>First Name</th>
                        <th>Birth Date</th>
                        <th>Address</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="person" items="${personList}">
                        <tr>
                            <td>${person.lastName}</td>
                            <td>${person.firstName}</td>
                            <td><fmt:formatDate value="${person.birthDate}" pattern="MMM d, yyyy" /></td>
                            <td>${person.address}</td>
                            <td><button class="btn btn-primary" onclick="_edit(${person.id})">Edit</button>
                                <button class="btn btn-danger" onclick="_delete(${person.id})">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    function _create() {
        location.href = "<c:url value="/person/create/"/>";
    }
    
    function _edit(id) {
        location.href = "<c:url value="/person/edit/"/>" + id;
    }
    
    function _delete(id) {
        bootbox.confirm("Delete this record?", function (ans) {
            if (ans) location.href = "<c:url value="/person/delete/"/>" + id;
        });   
    }
</script>

<%@include file="../footer.jsp" %>
