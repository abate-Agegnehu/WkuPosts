<nav
  data-bs-theme="dark"
  class="navbar navbar-expand bg-primary sticky-top"
  style="height: 60px"
>
  <div class="container-fluid">
    <a class="navbar-brand d-none d-md-block" href="#">
      <img
        src="images/icon.png"
        alt="Logo"
        width="30"
        height="30"
        class="d-inline-block align-text-top"
      />
      WKUPOSTS
    </a>
    <div class="d-flex" style="max-height: 40px">
      <form class="d-flex" style="margin: 0">
        <input
          class="form-control me-2"
          type="search"
          placeholder="Search"
          aria-label="Search"
        />
        <button class="btn btn-outline-light text-nowrap" type="submit">
          <i class="fa-brands fa-searchengin"></i> Search
        </button>
      </form>
      <form action="logout" method="post" style="margin: 0">
        <button
          type="submit"
          class="btn btn-warning ms-2 text-nowrap"
          style="max-height: 40px"
        >
          <i class="fa-solid fa-right-from-bracket"></i> Logout
        </button>
      </form>
    </div>
  </div>
</nav>
