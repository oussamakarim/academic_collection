package servlet;

import metier.beans.ChefDivision;
import metier.beans.Employee;
import metier.beans.User;
import metier.gestionnaire.GestionnaireUser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private GestionnaireUser user = new GestionnaireUser();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/pages/login.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cin = req.getParameter("cin");
        String pin = req.getParameter("pin");
        String message = "CIN ou bien PIN incorrect";
        HttpSession session = req.getSession();
        if (user.loginUser(cin, pin)) {
            User userLog = user.getByCin(cin);
            System.out.println(userLog.getUser().toString());
            if (userLog instanceof ChefDivision) {
                session.setAttribute("user", (ChefDivision) userLog);
                resp.sendRedirect("chef");
            } else if (userLog instanceof Employee) {
                session.setAttribute("user", (Employee) userLog);
                resp.sendRedirect("employe");
            }
        } else {
            req.setAttribute("message", message);
            this.getServletContext().getRequestDispatcher("/pages/login.jsp").forward(req, resp);
        }
    }
}
