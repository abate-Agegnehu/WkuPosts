<%@ include file="no-cache.jsp" %> <%@ include file="auth.jsp" %> <%@ page
isELIgnored="false" %>
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
        class="d-flex flex-column align-items-center pt-3 pe-3 text-white w-100"
      >
        <a
          href="add-post.jsp"
          type="button"
          class="btn btn-primary align-self-end mb-2"
          >Add Post</a
        >
        <c:if test="${myPosts != null && myPosts.size() != 0}">
          <c:forEach var="i" begin="0" end="${myPosts.size() - 1}">
            <div class="card mb-3 w-100" style="min-width: 170px">
              <div class="card-body">
                <h5 class="card-title">${myPosts.get(i).getTitle()}</h5>
                <h6 class="card-subtitle mb-2 text-muted">posted by: you</h6>
                <p class="card-text">${myPosts.get(i).getContent()}</p>
                <a
                  href="posts/delete?id=${myPosts.get(i).getId()}"
                  class="card-link btn btn-danger"
                  >Delete</a
                >
              </div>
            </div>
          </c:forEach>
        </c:if>
        <c:if test="${myPosts != null && myPosts.size() == 0}">
          <div colspan="5" class="text-center mt-5">No posts to display</div>
        </c:if>
      </div>
    </div>
    <%@ include file="footer.jsp" %>
  </body>
</html>
