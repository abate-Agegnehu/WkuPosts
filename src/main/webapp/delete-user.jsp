<%@ include file="no-cache.jsp" %> <%@ include file="auth.jsp" %> <%@ page
isELIgnored="false" %>
<html>
  <head>
    <%@ include file="header.jsp" %>
  </head>
  <body class="body--login">
    <%@ include file="navbar.jsp" %>
    <div class="d-flex justify-content-center">
      <div
        data-bs-theme="dark"
        class="card mt-3 me-3 ms-3 text-white"
        style="height: 100% !important; min-height: 100% !important"
      >
        <div class="card-header">Deleting a User</div>
        <div class="card-body">
          <p class="card-text">
            Are you sure you want to delete
            <span class="fw-bold">${toBeDeletedUser.getFirstName()}</span>
          </p>
          <a
            href="users/delete?id=${toBeDeletedUser.getId()}&confirmed=yes"
            class="btn btn-danger"
            >Delete</a
          >
          <a
            href="users/delete?id=${toBeDeletedUser.getId()}&confirmed=no"
            class="btn btn-outline-primery"
            >Cancel</a
          >
        </div>
      </div>
    </div>
  </body>
</html>
