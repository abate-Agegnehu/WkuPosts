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
        <h1 class="h6">Liked posts</h1>
        <c:if test="${likes != null && likes.size() != 0}">
                  <c:forEach var="i" begin="0" end="${likes.size() - 1}">
                    <div class="card mb-3 w-100" style="min-width: 170px">
                      <div class="card-body">
                        <h5 class="card-title">${likes.get(i).getTitle()}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">
                          posted by: ${likes.get(i).getUser().getFirstName()}
                        </h6>
                        <p class="card-text">${likes.get(i).getContent()}</p>

                        <c:if
                          test="${likes.get(i).getUser().getId() == user.getId()}"
                        >
                          <a
                            href="posts/delete?id=${allPosts.get(i).getId()}"
                            class="card-link btn btn-danger"
                            >Delete</a
                          >

                        </c:if>
                       <!-- <a
                        href="posts/Like?id=${likes.get(i).getId()}"
                        class="card-link btn btn-danger"
                        >Like</a
                       > -->
                       <a
                       href="posts/unlike?id=${likes.get(i).getId()}"
                       class="card-link btn btn-danger"
                       >Dislike</a
                      >
                      </div>
                    </div>
                  </c:forEach>
                </c:if>
                <c:if test="${likes != null && likes.size() == 0}">
                  <div colspan="5" class="text-center mt-5">No posts to display</div>
                </c:if>
      </div>
    </div>
    <%@ include file="footer.jsp" %>
  </body>
</html>
