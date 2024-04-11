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
        class="d-flex flex-column align-items-center mt-3 text-white w-100"
      >
        <h1 class="h6 mb-3">Create Post</h1>
        <form
          class="align-self-center col-lg-6 col-sm-12"
          action="posts/add"
          method="post"
        >
          <div class="mb-3">
            <label for="title" class="form-label">Post Title</label>
            <input
              type="text"
              required
              name="title"
              id="title"
              class="form-control"
            />
          </div>
          <div class="mb-3">
            <label for="content" class="form-label">Post Body</label>
            <textarea
              required
              name="content"
              id="content"
              rows="6"
              class="form-control"
            ></textarea>
          </div>
          <input type="submit" value="Create" class="btn btn-primary" />
        </form>
      </div>
    </div>
  </body>
</html>
