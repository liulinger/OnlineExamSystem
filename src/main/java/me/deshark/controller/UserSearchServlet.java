package me.deshark.controller;

import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.deshark.bean.UserBean;
import me.deshark.dao.UserDao;
import me.deshark.dao.impl.UserDaoImpl;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String username = req.getParameter("username");

        // 查询数据库来获取符合条件的用户(多用户列表未实现)
        UserDao userDao = new UserDaoImpl();
        UserBean user = userDao.getUserByUsername(username);

        // 构建动态 HTML 响应
//        String resultHTML = buildUserHTML(user);
//
//        resp.setContentType("text/html");

        // 将用户对象转换为JSON字符串
        String userJson = convertUserToJson(user);

        resp.setContentType("application/json");
        // 使用try-with-resources来确保Writer正确关闭，以避免资源泄漏
        try (PrintWriter writer = resp.getWriter()) {
            writer.write(userJson);
        }
    }

    private String buildUserHTML(UserBean user) {
        if (user == null) {
            return "<p>User not found</p>";
        }

        return "<ul>" +
                "<li>" + "学号: " + user.getUid() + "</li>" +
                "<li>" + "邮箱: " + user.getEmail() + "</li>" +
                "<li>" + "用户名: " + user.getUsername() + "</li>" +
                "<li>" + "权限: " + user.getPermission() + "</li>" +
                "</ul>";
    }

    private String convertUserToJson(UserBean user) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(user);
    }
}