<%@ include file="no-cache.jsp" %> <%@ include file="auth.jsp" %>
<html>
  <head>
    <%@ include file="header.jsp" %>
  </head>
  <body class="body--login">
    <%@ include file="navbar.jsp" %>
    <div class="d-flex">
      <div><%@ include file="sidebar.jsp" %></div>
      <div class="mt-3 me-3 text-white w-100">
        <h1 class="h6">Followed posts</h1>
        <c:if test="${follows != null && follows.size() != 0}">
          <c:forEach var="i" begin="0" end="${follows.size() - 1}">
            <div class="card mb-3 w-100" style="min-width: 170px">
              <div class="card-body">
                <h5 class="card-title">${follows.get(i).getTitle()}</h5>
                <h6 class="card-subtitle mb-2 text-muted">
                  posted by: ${follows.get(i).getUser().getFirstName()}
                </h6>
                <p class="card-text">${follows.get(i).getContent()}</p>

                <c:if
                  test="${follows.get(i).getUser().getId() == user.getId()}"
                >
                  <a
                    href="posts/delete?id=${allPosts.get(i).getId()}"
                    class="card-link btn btn-danger"
                    >Delete</a
                  >
                </c:if>
                <a
                  href="posts/Follow?id=${follows.get(i).getId()}"
                  class="card-link btn btn-danger"
                  >Follow</a
                >
                <a
                  href="posts/Unfollow?id=${follows.get(i).getId()}"
                  class="card-link btn btn-danger"
                  >Unfollow</a
                >
              </div>
            </div>
          </c:forEach>
        </c:if>
        <c:if test="${follows != null && follows.size() == 0}">
          <div colspan="5" class="text-center mt-5">No posts to display</div>
        </c:if>
      </div>
    </div>
    <%@ include file="footer.jsp" %>
  </body>
</html>
