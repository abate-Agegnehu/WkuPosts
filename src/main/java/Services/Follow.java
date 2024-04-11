package Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Utils.DBConnect;

public class Follow {
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

    public static void follow(int id, String username) throws SQLException {
        try {
            Connection con = DBConnect.getConnection();
            PreparedStatement follow = con.prepareStatement("Insert into follows (prim, username, id) values (?,?,?)");
            follow.setString(1, username + id);
            follow.setString(2, username);
            follow.setInt(3, id);
            follow.executeUpdate();
        } catch (SQLException e) {
            unfollow(id, username);
        }

    }

    public static void unfollow(int id, String username) throws SQLException {
        Connection con = DBConnect.getConnection();
        PreparedStatement unfollow = con.prepareStatement("delete from follows where prim = ?");
        unfollow.setString(1, username + id);
        unfollow.executeUpdate();
        selectFollowed(username);
    }

    public static List<Models.Post> selectFollowed(String username) throws SQLException {
        List<Models.Post> list = new ArrayList<>();
        Connection con = DBConnect.getConnection();
        PreparedStatement select = con.prepareStatement("select id from follows where username = ?");
        select.setString(1, username);
        ResultSet resultSet = select.executeQuery();
        while (resultSet.next()) {
            list.add(getPostById(resultSet.getInt("id")));
        }
        return list;
    }
}
