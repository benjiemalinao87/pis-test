<%@include file="../header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row">
    <div class="col-md-12">
        <h2 class="page-header">${title}</h2>
    </div>
    <div class="col-md-6 col-md-offset-2">
        <form:form id="frmMain" method="post" action="/pisweb/person/${postTo}" modelAttribute="model" class="form-horizontal" role="form">
            <form:hidden path="Id" />
            <div class="form-group">
                <label class="col-sm-3 control-label">Last Name</label>
                <div class="col-sm-9"><form:input path="lastName" class="form-control"/></div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">First Name</label>
                <div class="col-sm-9"><form:input path="firstName" class="form-control"/></div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Birth Date</label>
                <div class="col-sm-9">
                    <fmt:formatDate value="${model.birthDate}" var="bday" pattern="MMM d, yyyy"/>
                    <input name="birthDate" class="form-control" id="txtBirthDate" value="${bday}" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Address</label>
                <div class="col-sm-9"><form:textarea path="address" class="form-control"/></div>
            </div>
            <div class="form-group">
                <div class="col-sm-9 col-sm-offset-3">
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
            </div>
        </form:form>
    </div>
</div>
        
<script type="text/javascript">
    $(function () {
        $("#txtBirthDate").datepicker({ format: "M d, yyyy" });
        $("#frmMain").bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                lastName: {
                    validators: {
                        notEmpty: { message: 'This field is required.' },
                    },
                },
                firstName: {
                    validators: {
                        notEmpty: { message: 'This field is required.' },
                    },
                },
                birthDate: {
                    validators: {
                        notEmpty: { message: 'This field is required.' },
                    },
                },
            }
        });
    });
</script>

<%@include file="../footer.jsp" %>
