<c:set var="rootPath" value="<%= request.getContextPath() %>" />
<c:set var="requestPath" value="<%= request.getRequestURI() %>" />
<c:set var="indexPath" value="${rootPath}/posts.jsp" />
<c:set var="followsPath" value="${rootPath}/follows.jsp" />
<c:set var="likesPath" value="${rootPath}/likes.jsp" />
<c:set var="minePath" value="${rootPath}/mine.jsp" />
<c:set var="usersPath" value="${rootPath}/users.jsp" />
<div
  data-bs-theme="dark"
  class="d-flex flex-column flex-shrink-0 p-3 bg-body rounded-4 m-3 border border-primary"
  style="width: 180px; overflow: auto"
>
  <ul class="nav nav-pills flex-column gap-2">
    <li class="nav-item">
      <a
        href="index.jsp"
        class="nav-link link-body-emphasis ${requestPath == indexPath ? ' active': ''}"
        aria-current="page"
      >
        <i class="me-2 fa-solid fa-house"></i>
        All Posts
      </a>
    </li>
    <li>
      <a
        href="follows"
        class="nav-link link-body-emphasis ${requestPath == followsPath ? ' active': ''}"
      >
        <i class="me-2 fa-solid fa-heart-circle-plus"></i>
        Follows
      </a>
    </li>
    <li>
      <a
        href="likes"
        class="nav-link link-body-emphasis ${requestPath == likesPath ? ' active': ''}"
      >
        <i class="me-2 fa-solid fa-thumbs-up"></i>
        Likes
      </a>
    </li>
    <li>
      <a
        href="myposts"
        class="nav-link link-body-emphasis ${requestPath == minePath ? ' active': ''}"
      >
        <i class="me-2 fa-solid fa-user-tie"></i>
        Mine
      </a>
    </li>
    <li>
      <a
        href="users"
        class="nav-link link-body-emphasis ${requestPath == usersPath ? ' active': ''}"
      >
        <i class="me-2 fa-solid fa-users"></i>
        Users
      </a>
    </li>
  </ul>
</div>
