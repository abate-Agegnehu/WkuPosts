package Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/posts/add", "/posts/delete", "/myposts", "/posts", "/posts/Follow", "/posts/Unfollow",
        "/follows", "/posts/Like", "/posts/unlike", "/likes"
})
public class Post extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Models.User user = (Models.User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect(getServletContext().getContextPath() + "/login");
        } else {
            String action = req.getServletPath();
            if (action.equals("/posts/add")) {
                String title = req.getParameter("title");
                String body = req.getParameter("content");

                if (title != null && body != null) {
                    int result = Services.Post.addPost(title, body, user.getId());

                    if (result > 0) {
                        List<Models.Post> allPosts = Services.Post.getAllPosts();
                        List<Models.Post> myPosts = Services.Post.getPostsByUser(user.getId());

                        session.setAttribute("allPosts", allPosts);
                        session.setAttribute("myPosts", myPosts);

                        resp.sendRedirect(getServletContext().getContextPath() + "/posts.jsp");
                    }
                } else {
                    resp.sendRedirect(getServletContext().getContextPath() + "/add-post.jsp");
                }

            } else if (action.equals("/posts/delete")) {
                Integer postId = Integer.parseInt(req.getParameter("id"));
                String confirmed = req.getParameter("confirmed");
                Models.Post toBeDeletedPost = (Models.Post) Services.Post.getPostById(postId);
                if (toBeDeletedPost.getUser().getId() == user.getId()) {
                    if (confirmed == null && postId != null) {
                        session.setAttribute("toBeDeletedPost", toBeDeletedPost);
                        resp.sendRedirect(getServletContext().getContextPath() + "/delete-post.jsp");
                    } else if (confirmed != null && confirmed.equals("yes") && postId != null) {
                        Services.Post.removePost(postId);
                        resp.sendRedirect(getServletContext().getContextPath() + "/posts");
                    } else {
                        resp.sendRedirect(getServletContext().getContextPath() + "/posts");
                    }
                } else {
                    resp.sendRedirect(getServletContext().getContextPath() + "/posts");
                }
            } else if (action.equals("/myposts")) {
                List<Models.Post> myPosts = Services.Post.getPostsByUser(user.getId());
                session.setAttribute("myPosts", myPosts);
                resp.sendRedirect(getServletContext().getContextPath() + "/mine.jsp");
            }

            else if (action.equals("/posts/Follow")) {
                try {
                    Services.Follow.follow(Integer.parseInt(req.getParameter("id")), user.getUsername());
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                resp.sendRedirect(getServletContext().getContextPath() + "/posts");
            } else if (action.equals("/posts/Unfollow")) {
                try {
                    Services.Follow.unfollow(Integer.parseInt(req.getParameter("id")), user.getUsername());
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                resp.sendRedirect(getServletContext().getContextPath() + "/posts");
            }

            else if (action.equals("/follows")) {
                try {
                    List<Models.Post> followedPost = Services.Follow.selectFollowed(user.getUsername());
                    session.setAttribute("follows", followedPost);
                    resp.sendRedirect(getServletContext().getContextPath() + "/follows.jsp");
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }

            else if (action.equals("/posts/Like")) {
                try {
                    Services.Like.like(Integer.parseInt(req.getParameter("id")),
                            user.getUsername());
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                resp.sendRedirect(getServletContext().getContextPath() + "/posts");
            } else if (action.equals("/posts/unlike")) {
                try {
                    Services.Like.unlike(Integer.parseInt(req.getParameter("id")), user.getUsername());
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                resp.sendRedirect(getServletContext().getContextPath() + "/posts");
            } else if (action.equals("/likes")) {
                try {
                    List<Models.Post> followedPost = Services.Like.selectLiked(user.getUsername());
                    session.setAttribute("likes", followedPost);
                    resp.sendRedirect(getServletContext().getContextPath() + "/likes.jsp");
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            } else {
                List<Models.Post> allPosts;
                String userId = req.getParameter("uId");
                if (userId != null) {
                    allPosts = Services.Post.getPostsByUser(Integer.parseInt(userId));
                } else {
                    allPosts = Services.Post.getAllPosts();
                }

                session.setAttribute("allPosts", allPosts);

                resp.sendRedirect("posts.jsp");
            }
        }

    }
}
