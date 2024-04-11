<%@ include file="no-cache.jsp" %> <%@ include file="auth.jsp" %>
<html>
  <head>
    <%@ include file="header.jsp" %>
  </head>
  <body class="body--login">
    <%@ include file="navbar.jsp" %>
    <div class="d-flex">
      <div><%@ include file="sidebar.jsp" %></div>
      <div
        data-bs-theme="dark"
        class="pt-3 pe-3 d-flex flex-column align-items-center text-white w-100"
      >
        <c:if test="${user.getRole() == 'admin'}">
          <a
            href="add-user.jsp"
            type="button"
            class="btn btn-primary align-self-end mb-2"
            >Add User</a
          >
        </c:if>
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th scope="col">First Name</th>
              <th scope="col">Last Name</th>
              <th scope="col">Username</th>
              <th scope="col">Role</th>
              <th scope="col">Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:if test="${users != null && users.size() != 0}">
              <c:forEach var="i" begin="0" end="${users.size() - 1}">
                <tr>
                  <td scope="row">
                    <c:out value="${users.get(i).getFirstName()}" />
                  </td>
                  <td scope="row">
                    <c:out value="${users.get(i).getLastName()}" />
                  </td>
                  <td scope="row">
                    <c:out value="${users.get(i).getUsername()}" />
                  </td>
                  <td scope="row">
                    <c:out value="${users.get(i).getRole()}" />
                  </td>
                  <td scope="row">
                    <span
                      ><a href="posts?uId=${users.get(i).getId()}">
                        <i class="fa-solid fa-envelopes-bulk"></i
                      ></a>
                    </span>
                    <c:if test="${user.getRole() == 'admin'}">
                      <span class="ms-3"
                        ><a href="users/delete?id=${users.get(i).getId()}">
                          <i class="fa-solid fa-trash"></i></a
                      ></span>
                    </c:if>
                  </td>
                </tr>
              </c:forEach>
            </c:if>
            <c:if test="${users != null} && ${users.size() == 0}">
              <tr>
                <td colspan="5" class="text-center mt-5">
                  No users to display
                </td>
              </tr>
            </c:if>
          </tbody>
        </table>
      </div>
    </div>
    <%@ include file="footer.jsp" %>
  </body>
</html>
