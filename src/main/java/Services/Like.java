package Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Utils.DBConnect;

public class Like {
    private static final String selectPostByIdQuery = "SELECT p.id, p.title, p.content, p.user, u.first_name FROM posts p INNER JOIN users u ON u.id = p.user WHERE p.id = ?";

    public static Models.Post getPostById(int id) {
        try (
                Connection con = DBConnect.getConnection();
                PreparedStatement selectPost = con.prepareStatement(selectPostByIdQuery);) {
            selectPost.setInt(1, id);
            try (ResultSet resultSet = selectPost.executeQuery();) {
                if (resultSet.next()) {
                    return new Models.Post(
                            resultSet.getInt("id"),
                            resultSet.getString("title"),
                            resultSet.getString("content"),
                            new Models.User(
                                    resultSet.getInt("user"),
                                    resultSet.getString("first_name"),
                                    null, null, null, null));
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public static void like(int id, String username) throws SQLException {
        try {
            Connection con = DBConnect.getConnection();
            PreparedStatement like = con.prepareStatement("Insert into likes (prim, username, id) values (?,?,?)");
            like.setString(1, username + id);
            like.setString(2, username);
            like.setInt(3, id);
            like.executeUpdate();
        } catch (SQLException e) {
            unlike(id, username);
        }

    }

    public static void unlike(int id, String username) throws SQLException {
        Connection con = DBConnect.getConnection();
        PreparedStatement unlike = con.prepareStatement("delete from likes where prim = ?");
        unlike.setString(1, username + id);
        unlike.executeUpdate();
        selectLiked(username);
    }

    public static List<Models.Post> selectLiked(String username) throws SQLException {
        List<Models.Post> list = new ArrayList<>();
        Connection con = DBConnect.getConnection();
        PreparedStatement select = con.prepareStatement("select id from likes where username = ?");
        select.setString(1, username);
        ResultSet resultSet = select.executeQuery();
        while (resultSet.next()) {
            list.add(getPostById(resultSet.getInt("id")));
        }
        return list;
    }
}
