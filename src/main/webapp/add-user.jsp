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
        <h1 class="h6 mb-3">Register a User</h1>
        <form
          class="align-self-center col-lg-6 col-sm-12"
          action="users/add"
          method="post"
        >
          <div class="mb-3 row">
            <div class="col-6">
              <label for="firstName" class="form-label">First Name</label>
              <input
                type="text"
                required
                name="firstName"
                id="firstName"
                class="form-control"
              />
            </div>
            <div class="col-6">
              <label for="lastName" class="form-label">Last Name</label>
              <input
                type="text"
                required
                name="lastName"
                id="lastName"
                class="form-control"
              />
            </div>
          </div>
          <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input
              type="text"
              required
              name="username"
              id="username"
              class="form-control"
            />
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input
              type="password"
              required
              name="password"
              id="password"
              class="form-control"
            />
          </div>
          <div class="mb-3">
            <label for="role" class="form-label">Role</label>
            <select name="role" id="role" class="form-control">
              <option value="user" selected>USER</option>
              <option value="admin">ADMIN</option>
            </select>
          </div>
          <input type="submit" value="Register" class="btn btn-primary" />
        </form>
      </div>
    </div>
  </body>
</html>
