package Controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/users/add", "/users/delete", "/users" })
public class User extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Models.User user = (Models.User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("login.jsp");
        } else {
            String action = req.getServletPath();
            if (action.equals("/users/add")) {
                String firstName = req.getParameter("firstName");
                String lastName = req.getParameter("lastName");
                String password = req.getParameter("password");
                String username = req.getParameter("username");
                String role = req.getParameter("role");

                if (firstName != null && lastName != null && password != null && username != null && role != null) {
                    int result = Services.User.addUser(firstName, lastName, username, password, role);

                    if (result > 0) {
                        List<Models.User> users = Services.User.getAllUsers(user.getId());
                        session.setAttribute("users", users);
                        resp.sendRedirect(getServletContext().getContextPath() + "/users.jsp");
                    }
                } else {
                    resp.sendRedirect(getServletContext().getContextPath() + "/users.jsp");
                }

            } else if (action.equals("/users/delete")) {
                Integer userId = Integer.parseInt(req.getParameter("id"));
                String confirmed = req.getParameter("confirmed");
                if (confirmed == null && userId != null) {
                    Models.User toBeDeletedUser = (Models.User) Services.User.getUserById(userId);
                    session.setAttribute("toBeDeletedUser", toBeDeletedUser);
                    resp.sendRedirect(getServletContext().getContextPath() + "/delete-user.jsp");
                } else if (confirmed != null && confirmed.equals("yes") && userId != null) {
                    Services.User.removeUser(userId);
                    List<Models.User> users = Services.User.getAllUsers(user.getId());
                    session.setAttribute("users", users);
                    resp.sendRedirect(getServletContext().getContextPath() + "/users.jsp");
                } else {
                    resp.sendRedirect(getServletContext().getContextPath() + "/users.jsp");
                }
            } else {
                ArrayList<Models.User> users = (ArrayList<Models.User>) Services.User.getAllUsers(user.getId());
                // List<Post> allPosts = PostModel.getAllPosts();
                // List<Post> myPosts = PostModel.getPostsByUser(user.getId());

                session.setAttribute("users", users);
                // session.setAttribute("allPosts", allPosts);
                // session.setAttribute("myPosts", myPosts);

                resp.sendRedirect("users.jsp");
            }
        }

    }
}